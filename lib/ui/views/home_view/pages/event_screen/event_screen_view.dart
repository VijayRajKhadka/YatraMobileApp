import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/model/event_model.dart';
import 'package:yatra/ui/views/home_view/pages/event_screen/event_screen_view_model.dart';
import 'package:yatra/ui/widgets/shimmer_widget.dart';

import '../../../../widgets/event_card/event_card.dart';

class EventScreenView extends StackedView<EventScreenViewModel> {
  const EventScreenView({super.key});

  @override
  Widget builder(
      BuildContext context, EventScreenViewModel viewModel, Widget? child) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return ViewModelBuilder<EventScreenViewModel>.reactive(
      viewModelBuilder: () => EventScreenViewModel(),
      builder: (context, viewModel, child) {
        return DefaultTabController(
          length: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(text: 'Travel Events'),
                      Tab(text: 'Restaurant Events'),
                    ],
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final travelEvent =
                          ref.watch(viewModel.eventServices.travelEventProvider);
                      final restEvent =
                      ref.watch(viewModel.eventServices.restaurantventProvider);
                      return RefreshIndicator(
                        onRefresh: () async {
                          await Future.delayed(const Duration(milliseconds: 2000));
                          ref.refresh(viewModel.eventServices.travelEventProvider);
                          ref.refresh(viewModel.eventServices.restaurantventProvider);
                        },
                        child: SizedBox(
                          height: screenHeight*0.8,
                          child: TabBarView(
                            children: [
                              travelEvent.when(
                                data: (List<TravelEventModel> data) {
                                  return SizedBox(
                                    height: screenHeight*0.9,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          child: EventCard(
                                            name: data[index].name,
                                            contactNo: data[index].contactNo,
                                            location: data[index].location,
                                            startTime: data[index].startTime,
                                            endTime: data[index].endTime,
                                            eventImagePath: data[index].eventImagePath,
                                            title: data[index].title,
                                            body: data[index].body,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                                error: (Object error, StackTrace stackTrace) {
                                  return Center(
                                    child: Text("$error"),
                                  );
                                },
                                loading: () {
                                  return ShimmerWidget(
                                    height: screenHeight * 0.3,
                                    width: screenWidth * 0.9,
                                    boxCount: 5,
                                  );
                                },
                              ),
                              restEvent.when(
                                data: (List<RestaurantEventModel> data) {
                                  return SizedBox(
                                    height: screenHeight*0.9,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          child: EventCard(
                                            name: data[index].name,
                                            contactNo:data[index].openTime,
                                            location: data[index].location,
                                            startTime: data[index].startTime,
                                            endTime: data[index].endTime,
                                            eventImagePath: data[index].eventImagePath,
                                            title: data[index].title,
                                            body: data[index].body,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                                error: (Object error, StackTrace stackTrace) {
                                  return Center(
                                    child: Text("$error"),
                                  );
                                },
                                loading: () {
                                  return ShimmerWidget(
                                    height: screenHeight * 0.3,
                                    width: screenWidth * 0.9,
                                    boxCount: 5,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                      );
                    },
                  ),
                ],
              ),
            ),

        );
      },
    );
  }

  @override
  EventScreenViewModel viewModelBuilder(BuildContext context) =>
      EventScreenViewModel();
}
