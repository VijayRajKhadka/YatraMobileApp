import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yatra/core/helper/date_time_helper.dart';

import '../../core/helper/assets_helper.dart';

class TopUserCard extends StatelessWidget {
  final String name;
  final String profileUrl;
  final int totalCount;
  final String joinedAt;
  final int placeCount;
  final int trekCount;
  final int restaurantCount;


  const TopUserCard({
    super.key,
    required this.name,
    required this.profileUrl,
    required this.totalCount,
    required this.joinedAt, required this.placeCount, required this.trekCount, required this.restaurantCount,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight*0.1,
                  width: screenHeight*0.1,
                  child: ClipOval(
                    child: CachedNetworkImage(

                      placeholder: (context, url) => Image.asset(
                        AssetsHelper.logo,
                        width: screenHeight*0.1,
                        height: screenHeight*0.1,
                      ),
                      imageUrl: profileUrl,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Image.asset(
                        AssetsHelper.userLogo,  // Update with your actual error image path
                        width: screenHeight * 0.1,
                        height: screenHeight * 0.1,
                      ),// Ensure the image is cropped to fit within the circular boundary
                    ),
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name.length > 15 ? '${name.substring(0, 13)}...' : name,
                        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                      ),


                      Text(
                       "joined${DateTimeHelper.timeAgo(joinedAt)}",
                        style: const TextStyle(fontSize: 15,fontStyle: FontStyle.italic, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$totalCount",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,

                    ),
                  ),
                  Text(
                    "Treks: $trekCount",
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 13,
                      color: Colors.grey
                    ),
                  ),
                  Text(
                    "Places: $placeCount",
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                        color: Colors.grey
                    ),
                  ),Text(
                    "Restaurants: $restaurantCount",
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                        color: Colors.grey
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
}
