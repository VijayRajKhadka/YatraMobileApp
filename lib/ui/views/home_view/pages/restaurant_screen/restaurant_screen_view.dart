import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/ui/views/home_view/pages/restaurant_screen/restaurant_screen_view_model.dart';

import '../../../../widgets/trek_page_card/trekpage_card_view.dart';

class RestaurantView extends StackedView<RestaurantScreenViewModel> {
  const RestaurantView({super.key});

  @override
  Widget builder(BuildContext context, RestaurantScreenViewModel viewModel, Widget? child) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final restaurantProvider =
          ref.watch(viewModel.restaurantServices.restaurantProvider(viewModel.search.text));

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF9DD5F5),
              title: const Text(
                "EXPLORE PLACE",
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                iconSize: 32,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey), // Outer border
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                              ),
                              controller: viewModel.search,
                              onChanged: (query) {
                                viewModel.searchTrek(
                                    query); // Call the search method when text changes
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: viewModel.searchNow,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ToggleButtons(
                    isSelected: viewModel.toggle,
                    onPressed: (index) {
                      viewModel.toggleCategory(index);
                    },
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Local', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Fancy',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                      ),
                    ],
                  ),
                  RefreshIndicator(
                    onRefresh: () async {
                      ref.refresh(
                          viewModel.restaurantServices.restaurantProvider(viewModel.search.text=''));
                      viewModel.pagingController.refresh();
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: PagedListView(
                        padding: EdgeInsets.zero,
                        pagingController: viewModel.pagingController,
                        builderDelegate: PagedChildBuilderDelegate<dynamic>(
                          itemBuilder: (context, dynamic restaurantModel, index) {
                            if(viewModel.search.text.isEmpty) {
                              if ((viewModel.toggle[0] &&
                                  restaurantModel.category == "Local") ||
                                  (viewModel.toggle[1] &&
                                      restaurantModel.category == "Fancy")) {
                                return InkWell(
                                  onTap: () =>
                                      viewModel.goToRestaurant(restaurantModel),
                                  child: TrekPageCardView(
                                    name: restaurantModel.name,
                                    imagePath: restaurantModel
                                        .restaurantImages[0]
                                        .restaurantImagePath,
                                    rating: restaurantModel.avgRating,
                                    location: restaurantModel.location,
                                    category: restaurantModel.category,
                                  ),
                                );
                              } else {
                                // If category is not "local", return an empty container
                                return Container();
                              }
                            }else{
                              return InkWell(
                                onTap: () =>
                                    viewModel.goToRestaurant(restaurantModel),
                                child: TrekPageCardView(
                                  name: restaurantModel.name,
                                  imagePath: restaurantModel
                                      .restaurantImages[0]
                                      .restaurantImagePath,
                                  rating: restaurantModel.avgRating,
                                  location: restaurantModel.location,
                                  category: restaurantModel.category,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  RestaurantScreenViewModel viewModelBuilder(BuildContext context) => RestaurantScreenViewModel();

  @override
  void onViewModelReady(RestaurantScreenViewModel viewModel) {
    viewModel.pagingController.addPageRequestListener((pageKey) {
      viewModel.fetchPage(pageKey, viewModel.search.text);
    });
    super.onViewModelReady(viewModel);
  }
}
