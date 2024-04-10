import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/ui/widgets/review_card/review_card_view.dart';
import 'package:yatra/ui/widgets/shimmer_widget.dart';
import '../../../../../core/helper/assets_helper.dart';
import '../../../../../core/helper/date_time_helper.dart';
import '../../../../../core/helper/strings_helper.dart';
import '../../../../../model/trek_model.dart';
import '../../../../widgets/Slider.dart';
import 'trek_details_view_model.dart';

class TrekDetailsView extends StackedView<TrekDetailsViewModel> {
  final TrekModel trekModel;

  const TrekDetailsView({required this.trekModel, super.key});

  @override
  Widget builder(
      BuildContext context, TrekDetailsViewModel viewModel, Widget? child) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final trekDetailProvider = ref
            .watch(viewModel.trekServices.trekDetailProvider(trekModel.trekId));
        return RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 2000));
            ref.refresh(viewModel.trekServices.trekProvider(''));
            ref.refresh(viewModel.trekServices.trekDetailProvider(trekModel.trekId));
            viewModel.pagingController.refresh();
          },
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(trekModel.name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.star,size:32,color: Colors.orangeAccent,), // Your trailing icon
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return  SliderDialog(id: trekModel.trekId,isType: 'trek',);
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
                  // Handle back button pressed
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
                      items: trekModel.trekImages.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return CachedNetworkImage(
                                imageUrl: image.trekImagePath,
                                fit: BoxFit.cover,
                                width: screenWidth * 1,
                                height: screenHeight * 0.3,
                                placeholder: (context, url) => Image.asset(
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
                              "Added: ${DateTimeHelper.timeAgo(trekModel.createdAt)}",
                              style: const TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Text(
                          trekModel.name,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Row(
                            children: [
                              Row(
                                children: List.generate(
                                  trekModel.avgRating.toInt(),
                                  (index) => const Icon(
                                    Icons.star,
                                    color: CupertinoColors.activeOrange,
                                  ),
                                ),
                              ),
                              Text(
                                trekModel.avgRating.toStringAsPrecision(2),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined, size: 25),
                            Text(
                              trekModel.location,
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
                                  const Icon(Icons.category, size: 20),
                                  SizedBox(
                                    width: screenWidth * 0.02,
                                  ),
                                  Text(
                                    trekModel.category,
                                    style: const TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        trekDetailProvider.when(
                          data: (data) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(icon:const Icon(Icons.headphones), onPressed:()=> viewModel.speak(data.description))
,
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
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'Altitude',
                                                style: TextStyle(
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const SizedBox(width: 8),
                                                // Adjust as needed
                                                const Icon(Icons.height_outlined,
                                                    size: 20),
                                                Text(
                                                  data.altitude,
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
                                                'Trip Duration',
                                                style: TextStyle(
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0, bottom: 8.0),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                      Icons
                                                          .calendar_today_outlined,
                                                      size: 20),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0),
                                                    child: Text(
                                                      data.numberOfDays,
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10.0, left: 8.0),
                                              child: Text(
                                                'Budget Range',
                                                style: TextStyle(
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                      Icons
                                                          .monetization_on_outlined,
                                                      size: 20),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text(
                                                      'NRs.${data.budgetRange}',
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: InkWell(
                                          onTap: () => viewModel.showMap(
                                              context, data.mapUrl),
                                          child: SizedBox(
                                            width: screenWidth * 0.2,
                                            height: screenHeight * 0.3,
                                            child: Image.network(
                                              data.mapUrl,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0, left: 8.0),
                                  child: Text(
                                    'Emergency Number',
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.phone_in_talk_outlined,
                                          size: 20),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          data.emergencyNumber,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                          error: (error, stackTrace) {
                            return const Text("Sorry");
                          },
                          loading: () {
                            return ShimmerWidget(height: screenHeight*0.2, width: screenWidth*0.9, boxCount: 2);
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color:  StringsHelper.reviewContColor,
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
                          top: BorderSide(width: 2, color: Colors.grey.withOpacity(0.2))
                        ),
                      ),
                      height: screenHeight*0.1,
                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: TextField(
                                controller: viewModel.reviewController,
                                decoration: InputDecoration(
                                  suffixIcon:IconButton(icon: const Icon(Icons.send, color:  StringsHelper.reviewContColor,),onPressed: ()=>viewModel.postTrekReview(trekModel.trekId),) ,
                                  hintText: 'Write your review here', // Placeholder text
                                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(8),borderSide: BorderSide(color: Colors.black)), // Remove default border
                                ),
                                maxLines: null, // Allow multiple lines for the review
                                keyboardType: TextInputType.multiline, // Allow multiline input
                                style: const TextStyle(fontSize: 16), // Adjust text style as needed
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
  TrekDetailsViewModel viewModelBuilder(BuildContext context) =>
      TrekDetailsViewModel();

  @override
  void onViewModelReady(TrekDetailsViewModel viewModel) {
    viewModel.pagingController.addPageRequestListener((pageKey) {
      viewModel.fetchPage(pageKey, trekModel.trekId);
    });
    super.onViewModelReady(viewModel);
  }
}
