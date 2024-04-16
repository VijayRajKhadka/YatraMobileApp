import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:stacked/stacked.dart';
import '../../../core/helper/assets_helper.dart';

import 'login_view_model.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AssetsHelper.logo, height: screenHeight * 0.2),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30, bottom: 20),
                child: SizedBox(
                  height: screenHeight * 0.07,
                  child: TextField(
                    controller: viewModel.email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                      hintText: 'email',
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30, bottom: 20),
                child: SizedBox(
                  height: screenHeight * 0.07,
                  child: TextField(
                    controller: viewModel.password,
                    obscureText: viewModel.hidePassword,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'password',
                      suffixIcon: IconButton(
                        icon: (viewModel.hidePassword)
                            ? const Icon(EvaIcons.eye_off_2_outline)
                            : const Icon(EvaIcons.eye_outline),
                        onPressed: () {
                          viewModel.showPassword();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.85,
                height: screenHeight * 0.07,
                child: ElevatedButton(
                  onPressed: viewModel.loginUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't Have Account?"),
                    InkWell(
                      onTap: viewModel.goToLogin,
                        child: const Text(" Register Here", style: TextStyle(color: Colors.blueAccent),))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
