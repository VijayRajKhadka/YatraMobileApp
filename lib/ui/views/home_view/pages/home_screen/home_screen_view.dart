import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/model/historical_place.dart';
import 'package:yatra/ui/widgets/historical_place_card/historical_place_card_view.dart';
import 'package:yatra/ui/widgets/shimmer_widget.dart';
import '../../../../../model/place_model.dart';
import '../../../../../model/restaurant_model.dart';
import '../../../../../core/helper/assets_helper.dart';
import '../../../../../model/trek_model.dart';
import '../../../../widgets/home_page_card/homepage_card_view.dart';
import 'home_screen_view_model.dart';

import '../../common/top_nav_view/top_nav_view.dart';

class HomeScreenView extends StackedView<HomeScreenViewModel> {
  const HomeScreenView({super.key});

  @override
  Widget builder(
      BuildContext context, HomeScreenViewModel viewModel, Widget? child) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final trekProvider = ref.watch(viewModel.trekServices.trekProvider(''));
        final restaurantProvider =
            ref.watch(viewModel.restaurantServices.restaurantProvider(''));
        final placeProvider =
            ref.watch(viewModel.placeServices.placeProvider(''));
        final histProvider =
            ref.watch(viewModel.historicalPlaceServices.histProvider);

        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              ref.refresh(viewModel.trekServices.trekProvider(''));
              ref.refresh(viewModel.restaurantServices.restaurantProvider(''));
              ref.refresh(viewModel.placeServices.placeProvider(''));
              ref.refresh(viewModel.historicalPlaceServices.histProvider);
            },
            child: ListView(
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
                            InkWell(
                              onTap: viewModel.gotToHomeScreen,
                              child: TopNavView(
                                width: screenWidth * 0.40,
                                icon: Icons.stars_sharp,
                                text: "New Discovery",
                                borderColor: Colors.orangeAccent,
                              ),
                            ),
                            InkWell(
                              onTap: viewModel.goToTrekScreen,
                              child: TopNavView(
                                width: screenWidth * 0.22,
                                icon: Icons.snowshoeing_sharp,
                                text: "Trek",
                                borderColor: Colors.green,
                              ),
                            ),
                            InkWell(
                              onTap: viewModel.goToRestaurantScreen,
                              child: TopNavView(
                                width: screenWidth * 0.25,
                                icon: Icons.fastfood_sharp,
                                text: "Food",
                                borderColor: Colors.redAccent,
                              ),
                            ),
                            TopNavView(
                              onTap: viewModel.goToTravelAgency,
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
                Padding(
                  padding: const EdgeInsets.only( bottom: 10.0),
                  child: Container(
                    height: screenHeight * 0.35,
                    color: const Color.fromRGBO(210, 245, 247, 1),
                    child: histProvider.when(data: (List<HistoricalPlaceModel> data) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: ()=> viewModel.goToHistoricalDetails(data[index]),
                            child: HistoricalPlaceCard(
                                data[index].name,
                                data[index].historicalPlaceImages[0].historicalPlaceImagePath,
                                data[index].location,
                            )
                          );
                        },
                      );
                    }, error: (Object error, StackTrace stackTrace) {
                      return Center(
                        child: Text("$error"),
                      );
                    }, loading: () {
                      return ShimmerWidget(
                          height: screenHeight * 0.3,
                          width: screenWidth * 0.9,
                          boxCount: 1,
                      );
                    }),
                  ),
                ),
                Stack(alignment: Alignment.center, children: [
                  CachedNetworkImage(
                      imageUrl: AssetsHelper.homeImg3,
                      width: screenWidth,
                      height: screenHeight * 0.50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Image.asset(
                            AssetsHelper.logo,
                            width: screenWidth * 1,
                            height: screenHeight * 0.50,
                          )),
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
                          onPressed: viewModel.goToRecommendation,
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Trek',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                              child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 27,
                            ),
                            color: Colors.white,
                            onPressed: viewModel.goToTrekScreen,
                          )),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.black12,
                  height: screenHeight * 0.36,
                  child: trekProvider.when(data: (List<TrekModel> data) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length > 5 ? 5 : data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => viewModel.goToTrek(data[index]),
                          child: HomePageCardView(
                              data[index].name,
                              data[index].trekImages[0].trekImagePath,
                              data[index].avgRating,
                              data[index].location,
                              data[index].category),
                        );
                      },
                    );
                  }, error: (Object error, StackTrace stackTrace) {
                    print(stackTrace);
                    return Center(
                      child: Text("$error"),
                    );
                  }, loading: () {
                    return ShimmerWidget(
                        height: screenHeight * 0.3,
                        width: screenWidth * 0.9,
                        boxCount: 1);
                  }),
                ),
                Stack(alignment: Alignment.center, children: [
                  CachedNetworkImage(
                      imageUrl: AssetsHelper.homeImg2,
                      width: screenWidth,
                      height: screenHeight * 0.50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Image.asset(
                            AssetsHelper.logo,
                            width: screenWidth * 1,
                            height: screenHeight * 0.50,
                          )),
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

                    ],
                  )
                ]),
                Container(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Food',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                              child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 27,
                            ),
                            color: Colors.white,
                            onPressed: viewModel.goToRestaurantScreen,
                          )),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.black12,
                  height: screenHeight * 0.36,
                  child: restaurantProvider.when(
                      data: (List<RestaurantModel> data) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length > 5 ? 5 : data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => viewModel.goToRestaurant(data[index]),
                          child: HomePageCardView(
                              data[index].name,
                              data[index]
                                  .restaurantImages[0]
                                  .restaurantImagePath,
                              data[index].avgRating,
                              data[index].location,
                              data[index].category),
                        );
                      },
                    );
                  }, error: (Object error, StackTrace stackTrace) {
                    print(stackTrace);
                    return Center(
                      child: Text("$error"),
                    );
                  }, loading: () {
                    return ShimmerWidget(
                        height: screenHeight * 0.3,
                        width: screenWidth * 0.9,
                        boxCount: 1);
                  }),
                ),
                Stack(alignment: Alignment.center, children: [
                  CachedNetworkImage(
                      imageUrl: AssetsHelper.homeImg1,
                      width: screenWidth,
                      height: screenHeight * 0.50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Image.asset(
                            AssetsHelper.logo,
                            width: screenWidth * 1,
                            height: screenHeight * 0.50,
                          )),
                  Column(
                    children: [
                      const Text(
                        "Enjoy Unique Places",
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

                    ],
                  )
                ]),
                Container(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Places',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                              child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 27,
                            ),
                            color: Colors.white,
                            onPressed: viewModel.goToPlaceScreen,
                          )),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.black12,
                  height: screenHeight * 0.36,
                  child: placeProvider.when(data: (List<PlaceModel> data) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length > 5 ? 5 : data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => viewModel.goToPlace(data[index]),
                          child: HomePageCardView(
                              data[index].name,
                              data[index].placeImages[0].placeImagePath,
                              data[index].avgRating,
                              data[index].location,
                              data[index].category),
                        );
                      },
                    );
                  }, error: (Object error, StackTrace stackTrace) {
                    return Center(
                      child: Text("$error"),
                    );
                  }, loading: () {
                    return ShimmerWidget(
                        height: screenHeight * 0.3,
                        width: screenWidth * 0.9,
                        boxCount: 1);
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  HomeScreenViewModel viewModelBuilder(BuildContext context) =>
      HomeScreenViewModel();
}
