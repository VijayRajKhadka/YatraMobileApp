import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/app/app.router.dart';
import 'package:yatra/services/register_services.dart';

import '../../../app/app.locator.dart';

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
      // Validate all fields
      if (_validateFields()) {
        // Call the registerUser method from the RegisterService
        await _registerService.registerUser(
          name.text,
          email.text,
          contact.text,
          password.text,
          confirmPassword.text,
          editPhoto,
        );
        // Reset error message if registration is successful
        _resetErrorMessages();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful')),
        );
      }
    } catch (error) {
      // Set error message based on the error received from the API
      _setErrorMessage(error.toString());
    }
    notifyListeners(); // Notify listeners to update UI with new error message
  }

  bool _validateFields() {
    // Validate all fields
    bool isValid = true;
    if (commonValidator(email.text) != null) {
      isValid = false;
    }
    if (commonValidator(name.text) != null) {
      isValid = false;
    }
    if (commonValidator(contact.text) != null) {
      isValid = false;
    }
    if (commonValidator(password.text) != null) {
      isValid = false;
    }
    if (commonValidator(confirmPassword.text) != null) {
      isValid = false;
      errorMsg = 'Some Fields Are Still Empty';
    } else if (password.text != confirmPassword.text) {
      isValid = false;
      errorMsg = 'Passwords do not match';
    }
    return isValid;
  }

  void _resetErrorMessages() {
    errorMsg = '';
  }

  void _setErrorMessage(String message) {
    errorMsg = message;
  }
}
