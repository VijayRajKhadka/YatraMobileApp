import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/app/app.router.dart';
import 'package:yatra/core/helper/assets_helper.dart';
import 'package:yatra/services/authentication_services.dart';
import 'package:yatra/services/local_storage_service.dart';
import 'package:yatra/services/user_auth_services.dart';
import 'package:yatra/ui/views/home_view/pages/home_screen/home_screen_view.dart';

import '../../../app/app.locator.dart';

class LoginViewModel extends BaseViewModel {
  bool hidePassword = true;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final UserAuthServices _userAuthServices = locator<UserAuthServices>();
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();

  loginUser() {
    EasyLoading.show(status: "Logging...",maskType: EasyLoadingMaskType.black, indicator: Image.asset(AssetsHelper.loader, width: 50, height: 50));
    _authService.login(email.text, password.text).then((value) {
      _localStorageService.setToken(value.token);
      _userAuthServices.getUserInfo(value.token).then((value) {
        _localStorageService.setUserData(value.toJson());
        EasyLoading.dismiss();
        EasyLoading.showSuccess("Logged In Successfully");
        _navigationService.replaceWithHomeView();
      }).onError((error, stackTrace) {
        EasyLoading.dismiss();
        EasyLoading.showError("Invalid Email or Password");
      });
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      EasyLoading.showError("Invalid Email or Password");
    });
  }

  showPassword() {
    hidePassword = !hidePassword;
    rebuildUi();
  }

  goToLogin(){
    _navigationService.navigateToRegisterView();
  }
}
