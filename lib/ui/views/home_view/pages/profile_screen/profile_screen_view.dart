import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/core/helper/date_time_helper.dart';
import '../../../../../core/helper/assets_helper.dart';
import '../../../../../services/local_storage_service.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../model/user_model.dart';
import 'profile_screen_view_model.dart';

class ProfileScreenView extends StackedView<ProfileScreenViewModel> {
  const ProfileScreenView({super.key});

  @override
  Widget builder(
      BuildContext context, ProfileScreenViewModel viewModel, Widget? child) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final LocalStorageService localStorageServices =
        locator<LocalStorageService>();
    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: FutureBuilder<UserModel>(
          future: localStorageServices.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              EasyLoading.show(
                indicator: Image.asset(
                  AssetsHelper.loader,
                  width: screenWidth * 0.07,
                  height: screenHeight * 0.07,
                ),
              );
              return const Center();
            } else if (snapshot.hasError) {
              EasyLoading.dismiss();
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              EasyLoading.dismiss();
              final user = snapshot.data!;
              return Stack(
                children: [
                  SizedBox(
                    height: screenHeight * 0.2,
                    width: screenWidth,
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Image.asset(
                        AssetsHelper.logo,
                        width: screenWidth * 1,
                        height: screenHeight * 0.18,
                      ),
                      imageUrl: user.profileUrl,
                      width: screenWidth * 1,
                      height: screenHeight * 0.18,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    top: screenHeight * 0.17,
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('USER PROFILE', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Joined yatra ${DateTimeHelper.timeAgo(user.createdAt)}',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.12,
                                  width: screenWidth * 0.26,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(70),
                                      border: Border.all(
                                        color: viewModel.getRandomColor(),
                                        width: 3, // Set the border width
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(70),
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            Image.asset(
                                          AssetsHelper.userLogo,
                                          width: screenWidth * 1,
                                          height: screenHeight * 0.18,
                                          fit: BoxFit.cover,
                                        ),
                                        imageUrl: user.profileUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user.name,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '- ${user.email}',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.blueGrey),
                                      ),
                                      Text(
                                        '- ${user.contact}',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.blueGrey),
                                      ),
                                      Text(
                                        '- last updated profile ${DateTimeHelper.timeAgo(user.updatedAt)}',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.blueGrey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(

                            width: screenWidth * 0.8,
                            child: ElevatedButton(
                              onPressed: viewModel.logout,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              child: const Text("Logout"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  @override
  ProfileScreenViewModel viewModelBuilder(BuildContext context) =>
      ProfileScreenViewModel();
}
