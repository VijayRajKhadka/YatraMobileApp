import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/ui/views/home_view/pages/place_screen/place_screen_view_model.dart';

import '../../../../../model/place_model.dart';
import '../../../../widgets/trek_page_card/trekpage_card_view.dart';

class PlaceView extends StackedView<PlaceScreenViewModel> {
  const PlaceView({super.key});

  @override
  Widget builder(
      BuildContext context, PlaceScreenViewModel viewModel, Widget? child) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final placeProvider =
          ref.watch(viewModel.placeServices.placeProvider(viewModel.search.text));

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
                      padding: EdgeInsets.symmetric(horizontal: 16),
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
                  RefreshIndicator(
                    onRefresh: () async {
                      ref.refresh(
                          viewModel.placeServices.placeProvider(viewModel.search.text=''));
                      viewModel.pagingController.refresh();
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: PagedListView(
                        padding: EdgeInsets.zero,
                        pagingController: viewModel.pagingController,
                        builderDelegate: PagedChildBuilderDelegate<dynamic>(
                            itemBuilder: (context, dynamic placeModel, index) =>
                                InkWell(
                                  onTap: () => viewModel.goToPlace(placeModel),
                                  child: TrekPageCardView(
                                    name: placeModel.name,
                                    imagePath:
                                    placeModel.placeImages[0].placeImagePath,
                                    rating: placeModel.avgRating,
                                    location: placeModel.location,
                                    category: placeModel.category,
                                  ),
                                )),
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
  PlaceScreenViewModel viewModelBuilder(BuildContext context) =>
      PlaceScreenViewModel();

  @override
  void onViewModelReady(PlaceScreenViewModel viewModel) {
    viewModel.pagingController.addPageRequestListener((pageKey) {
      viewModel.fetchPage(pageKey, viewModel.search.text);
    });
    super.onViewModelReady(viewModel);
  }
}
