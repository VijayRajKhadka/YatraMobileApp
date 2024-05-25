import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/app/app.dart';
import 'package:yatra/model/travel_agency_model.dart';
import 'package:yatra/ui/views/home_view/pages/travel_agency_screen/travel_agency_view_model.dart';

import '../../../../../core/helper/assets_helper.dart';
import '../../../../../core/helper/date_time_helper.dart';

class TravelAgencyDetailView extends StackedView<TravelAgencyViewModel> {
  final TravelAgency travelAgency;

  const TravelAgencyDetailView({required this.travelAgency, super.key});

  @override
  Widget builder(
      BuildContext context, TravelAgencyViewModel viewModel, Widget? child) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          travelAgency.name,
          style: const TextStyle(
              color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 32, // Set the size of the icon here
          onPressed: () {
            viewModel.navigationService.back();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth,
            height: screenHeight * 0.3,
            child: CachedNetworkImage(
              imageUrl: travelAgency.agencyImageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              placeholder: (context, url) => Image.asset(
                AssetsHelper.logo,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Joined ${DateTimeHelper.timeAgo(travelAgency.createdAt.toString())}',
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
                Text(
                  travelAgency.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.local_post_office_outlined,
                      size: 25,
                    ),
                    Text(
                      ' ${travelAgency.email}',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.phone_in_talk_outlined,
                      size: 25,
                    ),
                    Text(
                      ' ${travelAgency.contactNo}',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 25,
                    ),
                    Text(
                      ' ${travelAgency.location}',
                      style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text("TRAVEL GUIDES", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.41,
                  child: ListView.builder(
                    itemCount: travelAgency.travelGuides.length,
                    itemBuilder: (context, index) {
                      TravelGuide guide = travelAgency.travelGuides[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: guide.profileUrl,
                                  fit: BoxFit.cover,
                                  width: screenWidth * 0.3,
                                  height: screenHeight * 0.13,

                                  placeholder: (context, url) => Image.asset(
                                    AssetsHelper.logo,
                                    fit: BoxFit.cover,
                                    width: screenWidth * 0.3,

                                    height: screenHeight * 0.13,

                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            'Joined ${DateTimeHelper.timeAgo(
                                                    guide.createdAt.toString())}',
                                            style: TextStyle(fontSize: 10),
                                          )),
                                      Text(
                                        guide.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                        ),
                                      ),
                                      const SizedBox(height: 8),

                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.perm_contact_cal_outlined,
                                              size: 16,
                                            ),
                                            Text(' ${guide.contact}'),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        guide.experience,
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey[300],
                                height: 1,
                              ),
                            ),
                          ],
                        ),

                      );
                    },

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  TravelAgencyViewModel viewModelBuilder(BuildContext context) =>
      TravelAgencyViewModel();
}
