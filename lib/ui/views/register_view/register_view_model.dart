import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/app/app.router.dart';
import 'package:yatra/services/register_services.dart';

import '../../../app/app.locator.dart';
import '../../../core/helper/assets_helper.dart';

class RegisterViewModel extends BaseViewModel {
  final ImagePicker _imagePicker = ImagePicker();
  final RegisterService _registerService = locator<RegisterService>();
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController contact = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final NavigationService _navigationService = locator<NavigationService>();
  bool hidePassword = true;

  String editPhoto = '';
  String? errorMsg;

  showPassword() {
    hidePassword = !hidePassword;
    rebuildUi();
  }

  String? commonValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Some Fields Are Empty';
    }
    return '';
  }
  goToRegister(){
    _navigationService.navigateToLoginView();
  }
  choosePhoto() {
    _imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 100)
        .then((value) {
      if (value != null) {
        editPhoto = value.path;
        notifyListeners();
      }
    });
  }

  registerUser(BuildContext context) async {
    try {

      if (_validateFields()) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            EasyLoading.show(status: "Registering...",maskType: EasyLoadingMaskType.clear, indicator: Image.asset(AssetsHelper.loader, width: 50, height: 50));
            return Container();
          },
        );

        var result = await _registerService.registerUser(
          name.value.text,
          email.value.text,
          contact.value.text,
          password.value.text,
          confirmPassword.value.text,
          editPhoto,
        );
        _resetErrorMessages();
        Navigator.pop(context);
        EasyLoading.dismiss();
        if(result==true){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration Completed Successfully'), backgroundColor: Colors.green,),
          );
          _navigationService.navigateToLoginView();
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sorry, Email Already Taken'), backgroundColor: Colors.red,),
          );
        }
      }
    } catch (error) {
      _setErrorMessage(error.toString());
    }
    notifyListeners();
  }

  bool _validateFields() {
    bool isValid = true;

    if (email.value.text.isEmpty) {
      errorMsg = 'Email is empty required';
      isValid = false;
    }

    if (name.value.text.isEmpty||name.value.text.length < 2) {
      errorMsg = 'Invalid Name';
      isValid = false;
    }

    if (contact.value.text.isEmpty || !RegExp(r'^[0-9]{10}$').hasMatch(contact.value.text)) {
      errorMsg = 'Contact needs to be a 10-digit number';
      isValid = false;
    }

    if (password.value.text.isEmpty||password.value.text.length < 6) {
      errorMsg = 'Password require 6 character';
      isValid = false;
    }

    if (editPhoto.isEmpty) {
      errorMsg = 'Profile Photo is required';
      isValid = false;
    }

    if (confirmPassword.value.text.isEmpty) {
      errorMsg = 'Confirm password is required';
      isValid = false;
    } else if (password.value.text != confirmPassword.value.text) {
      isValid = false;
      errorMsg = 'Passwords do not match';
    } else if (!_containsNumber(confirmPassword.value.text) || !_containsSpecialCharacter(confirmPassword.value.text)) {
      isValid = false;
      errorMsg = 'Password must contain at least one number and one special character';
    }

    return isValid;
  }

  bool _containsNumber(String value) {
    return RegExp(r'[0-9]').hasMatch(value);
  }

  bool _containsSpecialCharacter(String value) {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
  }


  void _resetErrorMessages() {
    errorMsg = '';
  }

  void _setErrorMessage(String message) {
    print(message);
    errorMsg = message;
  }
}
