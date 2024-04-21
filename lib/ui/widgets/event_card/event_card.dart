import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/core/helper/date_time_helper.dart';
import 'package:yatra/ui/widgets/event_card/event_card_model.dart';

import '../../../core/helper/assets_helper.dart';

class EventCard extends StackedView<EventCardModel> {
  final String name;
  final String contactNo;
  final String location;
  final String startTime;
  final String endTime;
  final String eventImagePath;
  final String title;
  final String body;

  const EventCard({
    super.key,
    required this.name,
    required this.contactNo,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.eventImagePath,
    required this.title,
    required this.body,
  });

  @override
  Widget builder(BuildContext context, EventCardModel viewModel, Widget? child) {
    final screenWidth =MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return InkWell(
      onTap: () {
        viewModel.toggleShowFullBody();
      },
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side: Image square
            SizedBox(
              width: screenWidth * 0.3,
              height: screenHeight * 0.13,
              child: CachedNetworkImage(
                placeholder: (context, url) => Image.asset(
                  AssetsHelper.logo,
                ),
                imageUrl: eventImagePath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ends: ${DateTimeHelper.timeAfter(DateTime.parse(endTime).toString())}',
                        style: const TextStyle(fontSize: 10, color: Colors.red),
                      ),
                      Text(
                        'Posted: ${DateTimeHelper.timeAgo(DateTime.parse(startTime).toString())}',
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Body
                  viewModel.showFullBody
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        body,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Name and other details
                      Text(
                        '$name\n$contactNo\n$location',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        body.length > 100 && !viewModel.showFullBody
                            ? '${body.substring(0, 100)}...'
                            : body,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      // Read more
                      TextButton(
                        onPressed: () {
                          viewModel.toggleShowFullBody();
                        },
                        child: Text(
                          'Read more',
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );  }


  @override
  EventCardModel viewModelBuilder(BuildContext context) =>EventCardModel();
}
