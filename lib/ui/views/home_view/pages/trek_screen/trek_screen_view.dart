import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
              final trekProvider = ref.watch(viewModel.trekServices.trekProvider);

              return RefreshIndicator(onRefresh: () async {
                await Future.delayed(const Duration(milliseconds: 2000));
                ref.refresh(viewModel.trekServices.trekProvider);
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
                    child: trekProvider.when(
                      data: (List<TrekModel> data) {
                        return Column(
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
                                      onPressed: (){},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => viewModel.goToTrek(data[index]),
                                  child: TrekPageCardView(
                                    data[index].name,
                                    data[index].trekImages[0].trekImagePath,
                                    data[index].avgRating,
                                    data[index].location,
                                    data[index].category,
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                      error: (Object error, StackTrace stackTrace) {
                        print(stackTrace);
                        return Center(
                          child: Text("$error"),
                        );
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
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

}