import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/app/app.locator.dart';
import 'package:yatra/app/app.router.dart';
import 'package:yatra/services/local_storage_service.dart';
import 'package:yatra/ui/views/login_view/login_view.dart';

import '../../../../../core/helper/assets_helper.dart';

class ProfileScreenViewModel extends BaseViewModel{
  final LocalStorageService _localStorageService = locator<LocalStorageService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  logout() async {
    try {
      EasyLoading.show(
        status: "Logging Out...",
        maskType: EasyLoadingMaskType.black,
        indicator: Image.asset(
          AssetsHelper.loader,
          width: 50,
          height: 50,
        ),
      );
       await _localStorageService.deleteToken();
        await _localStorageService.clearUserData();
       _navigationService.clearStackAndShowView(const LoginView()) ;
        EasyLoading.dismiss();
        EasyLoading.showSuccess("Logout out Successfully");
    } catch (error) {
      // Handle errors
      EasyLoading.dismiss();
      EasyLoading.showError("Failed to Logout");
      print("Error during logout: $error");
    }
  }

}