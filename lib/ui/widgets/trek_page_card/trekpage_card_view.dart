import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/core/helper/assets_helper.dart';
import 'package:yatra/ui/widgets/home_page_card/homepage_card_view_model.dart';

class TrekPageCardView extends StatelessWidget {
  final String name;
  final String imagePath;
  final double rating;
  final String location;
  final String category;

  const TrekPageCardView({super.key,
      required this.name,
      required this.imagePath,
      required this.rating,
      required this.location,
      required this.category,

      });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: screenWidth * 0.50,
        child: Stack(
          children: [
            // Background image
            CachedNetworkImage(
              imageUrl: imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: screenHeight * 0.20,
              placeholder: (context, url) => Image.asset(
                AssetsHelper.logo,
                width: screenWidth * 1,
                height: screenHeight * 0.18,
              ),
            ),
            // Overlaying information
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5), // Overlay color
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ), // Overlay color
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Row(
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
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 20,color: Colors.white,),
                        Text(
                          location,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.account_tree_outlined, size: 20,color: Colors.white,),
                        const SizedBox(width: 4),
                        Text(
                          category,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
