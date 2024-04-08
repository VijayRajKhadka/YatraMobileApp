import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/core/helper/date_time_helper.dart';
import 'review_card_model.dart';

class ReviewCardView extends StackedView<ReviewCardViewModel>{
  final String profileImageUrl;
  final String name;
  final String date;
  final String review;

  const ReviewCardView({super.key,
    required this.profileImageUrl,
    required this.name,
    required this.date,
    required this.review,
  });

  @override
  Widget builder(BuildContext context, ReviewCardViewModel viewModel, Widget? child) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circle box for profile image
            Container(
              width: MediaQuery.of(context).size.width*0.15,
              height: MediaQuery.of(context).size.width*0.15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              child: ClipOval(
                child: Image.network(
                  profileImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and date row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        DateTimeHelper.timeAgo(date),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Review text
                  InkWell(
                    onTap: viewModel.setIsExpanded,
                    child: Text(
                      review,
                      maxLines: viewModel.isExpanded?1000:4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14,

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
}

  @override
  ReviewCardViewModel viewModelBuilder(BuildContext context) => ReviewCardViewModel();


}