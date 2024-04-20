
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/ui/views/home_view/pages/restaurant_screen/restaurant_screen_view_model.dart';

import '../../../../widgets/trek_page_card/trekpage_card_view.dart';

class RestaurantView extends StackedView<RestaurantScreenViewModel> {
  const RestaurantView({super.key, Key});

  @override
  Widget builder(BuildContext context, RestaurantScreenViewModel viewModel, Widget? child) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final restaurantProvider =
        ref.watch(viewModel.restaurantServices.restaurantProvider(viewModel.search.text));

        return DefaultTabController(
          length: 2, // Number of tabs
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF9DD5F5),
              title: const Text(
                "EXPLORE PLACE",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                iconSize: 32,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Local Food'),
                  Tab(text: 'Fast Food'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _buildTabContent(viewModel, ref, 'Local'),
                _buildTabContent(viewModel, ref, 'Fancy'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabContent(
      RestaurantScreenViewModel viewModel, WidgetRef ref, String category) {

    return SingleChildScrollView(
      child: Column(
        children: [
          // Your existing search bar and content for each tab
          // Replace this with your existing code for each tab
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
          // Your existing RefreshIndicator and PagedListView for each tab
          // Replace this with your existing code for each tab
          RefreshIndicator(
            onRefresh: () async {
              ref.refresh(viewModel.restaurantServices.restaurantProvider(viewModel.search.text = ''));
              viewModel.pagingController.refresh();
            },
            child: SizedBox(
              height: 900,
              child: PagedListView(
                padding: EdgeInsets.zero,
                pagingController: viewModel.pagingController,
                builderDelegate: PagedChildBuilderDelegate<dynamic>(
                  itemBuilder: (context, dynamic restaurantModel, index) {
                    if (viewModel.search.text.isEmpty) {
                      if ((viewModel.toggle[0] &&
                          restaurantModel.category == category) ||
                          (viewModel.toggle[1] &&
                              restaurantModel.category == category)) {
                        return InkWell(
                          onTap: () => viewModel.goToRestaurant(restaurantModel),
                          child: TrekPageCardView(
                            name: restaurantModel.name,
                            imagePath: restaurantModel.restaurantImages[0].restaurantImagePath,
                            rating: restaurantModel.avgRating,
                            location: restaurantModel.location,
                            category: restaurantModel.category,
                          ),
                        );
                      } else {
                        // If category is not "local", return an empty container
                        return Container();
                      }
                    } else {
                      return InkWell(
                        onTap: () => viewModel.goToRestaurant(restaurantModel),
                        child: TrekPageCardView(
                          name: restaurantModel.name,
                          imagePath: restaurantModel.restaurantImages[0].restaurantImagePath,
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
    );
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
