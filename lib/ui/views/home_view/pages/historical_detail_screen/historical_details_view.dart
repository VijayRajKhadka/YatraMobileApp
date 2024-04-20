import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/helper/assets_helper.dart';
import '../../../../../core/helper/date_time_helper.dart';
import '../../../../../model/historical_place.dart';
import 'historical_details_view_model.dart';

class HistoricalDetailsView extends StackedView<HistoricalPlaceViewModel>{
  final HistoricalPlaceModel historicalPlaceModel;

  const HistoricalDetailsView({required this.historicalPlaceModel,super.key});


  @override
  Widget builder(BuildContext context, HistoricalPlaceViewModel viewModel, Widget? child) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final historicalProvider = ref.watch(
            viewModel.historicalPlaceServices.histProvider);
        return RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 2000));
            ref.refresh(viewModel.historicalPlaceServices.histProvider);
          },
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                historicalPlaceModel.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                iconSize: 32, // Set the size of the icon here
                onPressed: () {
                  viewModel.voiceHelper.stop();
                  viewModel.navigationService.back();
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
                      items: historicalPlaceModel.historicalPlaceImages.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return CachedNetworkImage(
                                imageUrl: image.historicalPlaceImagePath,
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
                                  historicalPlaceModel.createdAt)}",
                              style: const TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Text(
                          historicalPlaceModel.name,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),

                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined, size: 25,
                              color: Colors.blueAccent,),
                            Text(
                              historicalPlaceModel.location,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),

                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      right: 8.0,
                                      bottom: 10),
                                  child: ElevatedButton.icon(
                                    onPressed: () =>
                                        viewModel.startJourney(historicalPlaceModel),
                                    icon: const Icon(
                                      Icons.book,
                                      color: Colors.white,
                                    ),
                                    label: const Text(
                                      "Start Journey",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton
                                        .styleFrom(

                                      foregroundColor:
                                      Colors.white,
                                      backgroundColor:
                                      Colors.blueAccent,
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
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      icon: const Icon(Icons.headphones, color: Colors.green,),
                                      onPressed: () => viewModel.voiceHelper
                                          .speak(historicalPlaceModel.description)),
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
                                  historicalPlaceModel.description,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                              if (historicalPlaceModel.longitude != null &&
                                  historicalPlaceModel.longitude!=null)
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        right: 8.0,
                                        bottom: 10),
                                    child: ElevatedButton.icon(
                                      onPressed: () =>
                                          viewModel.geoMap(historicalPlaceModel.latitude, historicalPlaceModel.longitude),
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
                                ),

                              SizedBox(
                                height: screenHeight * 0.3,
                                child: InkWell(
                                  onTap: () => viewModel.showMap(
                                      context, historicalPlaceModel.mapUrl),
                                  child: InteractiveViewer(
                                      boundaryMargin: EdgeInsets.all(20.0),
                                      minScale: 0.1,
                                      maxScale: 2.0,
                                      child:CachedNetworkImage(
                                      imageUrl: historicalPlaceModel.mapUrl,

                                        placeholder: (context, url) =>
                                            Image.asset(
                                              AssetsHelper.logo,
                                              width: screenWidth * 1,
                                            )),
                                  ),

                                )
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
                                              'Open-Time',
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                          ),

                                          Row(
                                            children: [
                                              const SizedBox(width: 8),
                                              // Adjust as needed
                                              const Icon(
                                                Icons.access_time_outlined,
                                                size: 20, color: Colors.blue,),
                                              Text(
                                                historicalPlaceModel.openTime,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.02,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Ticket (for Tourist only)',
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                          ),

                                          Row(
                                            children: [
                                              const SizedBox(width: 8),
                                              // Adjust as needed
                                              const Icon(
                                                Icons.attach_money_outlined,
                                                size: 20, color: Colors.green,),
                                              Text(
                                                'NRs. '+historicalPlaceModel.ticketPrice,
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
                                                historicalPlaceModel.getThere,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Contact',
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                          ),

                                          Row(
                                            children: [
                                              const SizedBox(width: 8),
                                              // Adjust as needed
                                              const Icon(
                                                Icons.call,
                                                size: 20, color: Colors.red,),
                                              Text(
                                                ' '+ historicalPlaceModel.contactNo,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ],
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
  HistoricalPlaceViewModel viewModelBuilder(BuildContext context)=> HistoricalPlaceViewModel();
}