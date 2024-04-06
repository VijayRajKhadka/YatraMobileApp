import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/services/trek_services.dart';
import '../../../../../core/helper/assets_helper.dart';
import '../../../../../model/trek_model.dart';
import 'home_screen_view_model.dart';

import '../../common/top_nav_view/top_nav_view.dart';

class HomeScreenView extends StackedView<HomeScreenViewModel> {
  const HomeScreenView({super.key});

  @override
  Widget builder(
      BuildContext context, HomeScreenViewModel viewModel, Widget? child) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 10),
            child: Text(
              "Category",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.08,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopNavView(
                        width: screenWidth * 0.40,
                        icon: Icons.stars_sharp,
                        text: "New Discovery",
                        borderColor: Colors.orangeAccent,
                      ),
                      TopNavView(
                        width: screenWidth * 0.22,
                        icon: Icons.snowshoeing_sharp,
                        text: "Trek",
                        borderColor: Colors.green,
                      ),
                      TopNavView(
                        width: screenWidth * 0.25,
                        icon: Icons.fastfood_sharp,
                        text: "Food",
                        borderColor: Colors.redAccent,
                      ),
                      TopNavView(
                        width: screenWidth * 0.28,
                        icon: Icons.calendar_today_outlined,
                        text: "Events",
                        borderColor: Colors.lightBlueAccent,
                      ),
                      TopNavView(
                        width: screenWidth * 0.40,
                        icon: Icons.call,
                        text: "Travel Agency",
                        borderColor: Colors.blueGrey,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: screenHeight * 0.35,
          ),
          Stack(alignment: Alignment.center, children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.2), BlendMode.srcOver),
              // Adjust opacity here
              child: Image.asset(AssetsHelper
                  .trek1), // Replace 'assets/image.png' with your image path
            ),
            Column(
              children: [
                const Text(
                  "Explore & Plan Trek",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "..start planning with yatra",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                SizedBox(
                  width: screenWidth * 0.35,
                  child: ElevatedButton(
                    onPressed: viewModel.goToTrek,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                                width: 1, color: Colors.white))),
                    child: const Text("PLAN"),
                  ),
                )
              ],
            )
          ]),
          // Your existing widgets
           Container(
             color: Colors.grey,
             child: const Padding(
               padding: EdgeInsets.only(left: 15.0, top: 8.0, bottom: 8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     'Trek',
                     style: TextStyle(
                       fontSize: 25,
                       fontWeight: FontWeight.bold,
                       color: Colors.white
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(right: 8.0),
                     child: InkWell(child: Icon(Icons.arrow_forward_ios_outlined, size: 27,color: Colors.white,)),
                   )
                 ],
               ),
             ),
           ),
          Container(
            color: Colors.black12,
            height: screenHeight * 0.33,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth * 0.49,
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
                        child: Image.asset(
                          AssetsHelper.trek1,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.only(left:10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Mardi Himal",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.orangeAccent,
                                ),
                                Text(
                                  "2.4",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.only(left:10, right: 10),
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 20),
                            SizedBox(width: 4),
                            Text(
                              "Pokhara, Nepal",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Padding(
                        padding: EdgeInsets.only(left:10, right: 10),
                        child: Row(
                          children: [
                            Icon(Icons.accessibility_outlined, size: 20),
                            SizedBox(width: 4),
                            Text(
                              "- Intermediate",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Icon(Icons.account_tree_outlined, size: 20),
                            SizedBox(width: 4),
                            Text(
                              "- Long-Trek",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ]),
          ),
          Stack(alignment: Alignment.center, children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.2), BlendMode.srcOver),
              // Adjust opacity here
              child: Image.asset(AssetsHelper
                  .food1), // Replace 'assets/image.png' with your image path
            ),
            Column(
              children: [
                const Text(
                  "Real local food of Nepal",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "..start exploring with yatra",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                SizedBox(
                  width: screenWidth * 0.35,
                  child: ElevatedButton(
                    onPressed: viewModel.goToTrek,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                                width: 1, color: Colors.white))),
                    child: const Text("Explore"),
                  ),
                )
              ],
            )
          ]),
          Container(
            color: Colors.grey,
            child: const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Food',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: InkWell(child: Icon(Icons.arrow_forward_ios_outlined, size: 27,color: Colors.white,)),
                  )
                ],
              ),
            ),
          ),        ],
      ),
    );
  }

  @override
  HomeScreenViewModel viewModelBuilder(BuildContext context) =>
      HomeScreenViewModel();
}
