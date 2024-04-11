import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/helper/strings_helper.dart';
import 'place_details_view_model.dart';

import '../../../../../core/helper/assets_helper.dart';
import '../../../../../core/helper/date_time_helper.dart';
import '../../../../../model/place_model.dart';
import '../../../../widgets/Slider.dart';
import '../../../../widgets/review_card/review_card_view.dart';
import '../../../../widgets/shimmer_widget.dart';

class PlaceDetailView extends StackedView<PlaceDetailsViewModel> {
  final PlaceModel placeModel;

  const PlaceDetailView(this.placeModel, {super.key});

  @override
  Widget builder(BuildContext context, PlaceDetailsViewModel viewModel,
      Widget? child) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final placeDetailProvider = ref.watch(
            viewModel.placeServices.placeDetailProvider(placeModel.placeId));
        return RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 2000));
            ref.refresh(viewModel.placeServices.placeProvider(''));
            ref.refresh(viewModel.placeServices
                .placeDetailProvider(placeModel.placeId));
            viewModel.pagingController.refresh();
          },
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                placeModel.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.star,
                    size: 32,
                    color: Colors.orangeAccent,
                  ),
                  // Your trailing icon
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SliderDialog(
                          id: placeModel.placeId,
                          isType: 'place',
                        );
                      },
                    );
                  },
                ),
              ],
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                iconSize: 32, // Set the size of the icon here
                onPressed: () {
                  viewModel.voiceHelper.stop();
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.3,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: screenHeight * 0.3,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                        const Duration(milliseconds: 1000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        pauseAutoPlayOnTouch: true,
                        enlargeCenterPage: false,
                      ),
                      items: placeModel.placeImages.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return CachedNetworkImage(
                                imageUrl: image.placeImagePath,
                                fit: BoxFit.cover,
                                width: screenWidth * 1,
                                height: screenHeight * 0.3,
                                placeholder: (context, url) =>
                                    Image.asset(
                                      AssetsHelper.logo,
                                      width: screenWidth * 1,
                                      height: screenHeight * 0.3,
                                    ));
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Added: ${DateTimeHelper.timeAgo(
                                  placeModel.createdAt)}",
                              style: const TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Text(
                          placeModel.name,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Row(
                            children: [
                              Row(
                                children: List.generate(
                                  placeModel.avgRating.toInt(),
                                      (index) =>
                                  const Icon(
                                    Icons.star,
                                    color: CupertinoColors.activeOrange,
                                  ),
                                ),
                              ),
                              Text(
                                placeModel.avgRating.toStringAsPrecision(2),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined, size: 25,
                              color: Colors.blueAccent,),
                            Text(
                              placeModel.location,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.category, size: 20,
                                    color: Colors.yellow,),
                                  SizedBox(
                                    width: screenWidth * 0.02,
                                  ),
                                  Text(
                                    placeModel.category,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                        placeDetailProvider.when(data: (data) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      icon: const Icon(Icons.headphones, color: Colors.green,),
                                      onPressed: () => viewModel.voiceHelper
                                          .speak(data.description)),
                                  IconButton(
                                      onPressed: viewModel.voiceHelper.pause,
                                      icon: const Icon(Icons.pause,color: Colors.blue,)),
                                  IconButton(
                                      onPressed: viewModel.voiceHelper.stop,
                                      icon: const Icon(Icons.stop, color: Colors.red,)),
                                ],
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 8.0, top: 8.0),
                                child: Text(
                                  data.description,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(right: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Open-Time',
                                                  style: TextStyle(
                                                      fontSize: 23,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ),
                                              if (data.longitude != null &&
                                                  data.longitude!.isNotEmpty)
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      right: 8.0,
                                                      bottom: 10),
                                                  child: ElevatedButton.icon(
                                                    onPressed: () =>
                                                        viewModel.geoMap(
                                                          double.parse(
                                                              data.latitude!),
                                                          double.parse(
                                                              data.longitude!),
                                                        ),
                                                    icon: const Icon(
                                                      Icons.location_on,
                                                      color: Colors.white,
                                                    ),
                                                    label: const Text(
                                                      "Explore in Map",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(

                                                      foregroundColor:
                                                      Colors.white,
                                                      backgroundColor:
                                                      Colors.greenAccent,
                                                      // Text color
                                                      side: const BorderSide(
                                                          color: Colors.white),
                                                      // Border color
                                                      shape:
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            18.0), // Button border radius
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                ],
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(width: 8),
                                              // Adjust as needed
                                              const Icon(
                                                Icons.access_time_outlined,
                                                size: 20, color: Colors.blue,),
                                              Text(
                                                data.openTime,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: screenHeight * 0.02),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'How To Get There',
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0, bottom: 8.0),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: Text(
                                                data.getThere,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }, error: (error, stackTrace) {
                          return const Text("Sorry");
                        }, loading: () {
                          return ShimmerWidget(
                              height: screenHeight * 0.2,
                              width: screenWidth * 0.9,
                              boxCount: 2);
                        })
                      ],
                    ),
                  ),
                  Container(
                    color: StringsHelper.reviewContColor,
                    child: const Padding(
                      padding:
                      EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Reviews",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.3,
                    child: PagedListView(
                      padding: EdgeInsets.zero,
                      pagingController: viewModel.pagingController,
                      builderDelegate: PagedChildBuilderDelegate<dynamic>(
                        itemBuilder: (context, dynamic reviewModel, index) =>
                            Align(
                              alignment: Alignment.topCenter,
                              child: ReviewCardView(
                                profileImageUrl: reviewModel.user.profileUrl,
                                name: reviewModel.user.name,
                                date: reviewModel.createdAt,
                                review: reviewModel.review,
                              ),
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                width: 2, color: Colors.grey.withOpacity(0.2))),
                      ),
                      height: screenHeight * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: TextField(
                                controller: viewModel.reviewController,
                                decoration: InputDecoration(
                                  focusColor: StringsHelper.reviewContColor,
                                  fillColor: StringsHelper.reviewContColor,

                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.send,
                                      color: StringsHelper.reviewContColor,),
                                    onPressed: () =>
                                        viewModel
                                            .postTrekReview(placeModel.placeId),
                                  ),
                                  hintText: 'Write your review here',
                                  // Placeholder text
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                    const BorderSide(color: Colors.black),
                                  ),
                                ),
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  PlaceDetailsViewModel viewModelBuilder(BuildContext context) =>
      PlaceDetailsViewModel();

  @override
  void onViewModelReady(PlaceDetailsViewModel viewModel) {
    viewModel.pagingController.addPageRequestListener((pageKey) {
      viewModel.fetchPlaceReview(pageKey, placeModel.placeId);
    });
    super.onViewModelReady(viewModel);
  }
}
