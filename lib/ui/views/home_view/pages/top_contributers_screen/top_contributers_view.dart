import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/ui/views/home_view/pages/top_contributers_screen/top_contributers_view_models.dart';
import 'package:yatra/ui/widgets/top_user_card.dart';
import '../../../../widgets/shimmer_widget.dart';

class TopUsersView extends StackedView<TopUserViewModel> {
  const TopUsersView({super.key});

  @override
  Widget builder(BuildContext context, TopUserViewModel viewModel, Widget? child) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final topUser = ref.watch(viewModel.topUserServices.topUserProvider);
        return Container(
          child: topUser.when(
            data: (data) {
              return RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 2000));
                  ref.refresh(viewModel.topUserServices.topUserProvider);
                },
                child: Column(
                  children: [
                     Padding(
                      padding: const EdgeInsets.only(top:34.0),
                      child: Container(
                        color: Colors.yellow,
                        width: screenWidth,
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.stars_sharp, size:40, color: Colors.white,),
                                Text(
                                  "Top Contributors",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (BuildContext context, int index) => const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Divider(thickness: 1,color: Colors.black12,),
                        ),
                        itemBuilder: (context, index) {
                          final user = data[index];
                          return TopUserCard(
                            name: user.name,
                            profileUrl: user.profileUrl,
                            totalCount: user.totalCount,
                            joinedAt: user.createdAt,
                            placeCount: user.placeCount,
                            trekCount: user.trekCount,
                            restaurantCount: user.restaurantCount,
                          );
                        },
                      ),
                    ),

                  ],
                ),
              );
            },
            error: (error, stackTrace) {
              return const Center(child: Text("Sorry, Some Error Occurred"));
            },
            loading: () {
              return ShimmerWidget(
                height: screenHeight * 0.2,
                width: screenWidth * 0.9,
                boxCount: 4,
              );
            },
          ),
        );
      },
    );
  }

  @override
  TopUserViewModel viewModelBuilder(BuildContext context) => TopUserViewModel();
}
