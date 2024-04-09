import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/ui/views/home_view/pages/trek_screen/trek_screen_view_model.dart';

import '../../../../../model/trek_model.dart';
import '../../../../widgets/trek_page_card/trekpage_card_view.dart';

class TrekView extends StackedView<TrekScreenViewModel> {
  const TrekView({super.key});

  @override
  Widget builder(BuildContext context, TrekScreenViewModel viewModel,
      Widget? child) {

          return  Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final trekProvider = ref.watch(viewModel.trekServices.trekProvider(viewModel.search.text));

              return RefreshIndicator(onRefresh: () async {
                await Future.delayed(const Duration(milliseconds: 2000));
                ref.refresh(viewModel.trekServices.trekProvider(viewModel.search.text));
                viewModel.pagingController.refresh();

              },
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: const Color(0xFF9DD5F5),
                    title: const Text("EXPLORE TREK", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
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
                                      viewModel.searchTrek(query); // Call the search method when text changes
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.search),
                                  onPressed:
                                    viewModel.searchNow
                                  ,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.8,
                          child: PagedListView(
                            padding: EdgeInsets.zero,
                            pagingController: viewModel.pagingController,
                            builderDelegate: PagedChildBuilderDelegate<dynamic>(
                              itemBuilder: (context, dynamic trekModel, index) =>
                                  InkWell(
                                    onTap: () => viewModel.goToTrek(trekModel),
                                    child: TrekPageCardView(
                                      name: trekModel.name,
                                      imagePath: trekModel.trekImages[0].trekImagePath,
                                      rating: trekModel.avgRating,
                                      location:trekModel.location,
                                      category: trekModel.category,
                                    ),
                                  )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          );

  }

  @override
  TrekScreenViewModel viewModelBuilder(BuildContext context) =>
      TrekScreenViewModel();

  @override
  void onViewModelReady(TrekScreenViewModel viewModel) {
    viewModel.pagingController.addPageRequestListener((pageKey) {
      viewModel.fetchPage(pageKey, viewModel.search.text);
    });
    super.onViewModelReady(viewModel);
  }
}