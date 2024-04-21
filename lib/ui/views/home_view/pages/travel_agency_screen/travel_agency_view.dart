import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/core/helper/date_time_helper.dart';
import 'package:yatra/ui/views/home_view/pages/travel_agency_screen/travel_agency_view_model.dart';

import '../../../../../core/helper/assets_helper.dart';
import '../../../../../model/travel_agency_model.dart';
import '../../../../widgets/shimmer_widget.dart';

class TravelAgencyView extends StackedView<TravelAgencyViewModel> {
  const TravelAgencyView({super.key});

  @override
  Widget builder(
      BuildContext context, TravelAgencyViewModel viewModel, Widget? child) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Consumer(
      builder: (context, ref, child) {
        final travelAgency =
            ref.watch(viewModel.travelAgencyServices.travelAgencyProvider);
        final restEvent =
            ref.watch(viewModel.travelAgencyServices.travelAgencyProvider);
        return RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 2000));
            ref.refresh(viewModel.travelAgencyServices.travelAgencyProvider);
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('TRAVEL AGENCY'),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: travelAgency.when(
                data: (List<TravelAgency> data) {
                  return SizedBox(
                    height: screenHeight * 0.9,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: screenHeight + 0.9,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: ()=> viewModel.showAgency(data[index]),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: screenWidth * 0.3,
                                        height: screenHeight * 0.13,
                                        color: Colors.grey, // Placeholder color
                                        child: CachedNetworkImage(
                                          imageUrl: data[index].agencyImageUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                          placeholder: (context, url) =>
                                              Image.asset(
                                            AssetsHelper.logo,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.topRight,
                                                child: Text('Joined '+
                                                    DateTimeHelper.timeAgo(
                                                        data[index]
                                                            .createdAt
                                                            .toString()), style: TextStyle(fontSize: 10),)),
                                            Text(
                                              data[index].name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                const Icon(Icons.local_post_office_outlined, size: 16,),
                                                Text(' ${data[index].email}'),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.phone_in_talk_outlined, size: 16,),
                                                Text(' ${data[index].contactNo}'),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.location_on_outlined, size: 16,),
                                                Text(' ${data[index].location}'),
                                              ],
                                            ),                                        ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
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
            ),
          ),
        );
      },
    );
  }

  @override
  TravelAgencyViewModel viewModelBuilder(BuildContext context) =>
      TravelAgencyViewModel();
}
