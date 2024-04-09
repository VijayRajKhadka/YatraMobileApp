import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/core/helper/assets_helper.dart';
import 'package:yatra/ui/widgets/home_page_card/homepage_card_view_model.dart';

class HomePageCardView extends StackedView<HomePageCardViewModel> {
  final String name;
  final String imagePath;
  final double rating;
  final String location;
  final String category;

  const HomePageCardView(
      this.name, this.imagePath, this.rating, this.location, this.category,
      {super.key});

  @override
  Widget builder(
      BuildContext context, HomePageCardViewModel viewModel, Widget? child) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: screenWidth * 0.50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: CachedNetworkImage(
                  imageUrl: imagePath,
                  fit: BoxFit.cover,
                  width: screenWidth * 1,
                  height: screenHeight * 0.18,
                  placeholder: (context, url) => Image.asset(
                        AssetsHelper.logo,
                        width: screenWidth * 1,
                        height: screenHeight * 0.18,
                      )),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: screenWidth * 0.49,
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      rating.toInt(),
                      (index) => const Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                        size: 18,
                      ),
                    ),
                  ),
                  Text(
                    rating.toStringAsPrecision(2),
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                width: screenWidth * 0.49,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Icon(Icons.location_on_outlined, size: 20)),
                    Expanded(
                      flex: 8,
                      child: Text(
                        location,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.account_tree_outlined, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    category,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    @override
    HomePageCardViewModel viewModelBuilder(BuildContext context) =>
        HomePageCardViewModel();
  }

  @override
  HomePageCardViewModel viewModelBuilder(BuildContext context) =>
      HomePageCardViewModel();
}
