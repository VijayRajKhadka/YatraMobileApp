import 'dart:io';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/core/helper/strings_helper.dart';
import 'register_view_model.dart';

class RegisterView extends StatelessWidget {
  final String errorMessage;

  const RegisterView({Key? key, this.errorMessage = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                InkWell(
                  onTap: viewModel.choosePhoto,
                  child: Center(
                    child: Stack(
                      children: [
                        (viewModel.editPhoto == "")
                            ? const CircleAvatar(
                          radius: 60,
                          backgroundColor: StringsHelper.reviewContColor,
                          child: CircleAvatar(
                            radius: 55,
                            child: ClipOval(
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  size: 70,
                                )),
                          ),
                        )
                            : CircleAvatar(
                          radius: 60,
                          backgroundColor: StringsHelper.reviewContColor,
                          child: CircleAvatar(
                            radius: 55,
                            backgroundImage:
                            FileImage(File(viewModel.editPhoto)),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: StringsHelper.reviewContColor,
                                  shape: BoxShape.circle),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.add_a_photo_outlined,
                                  color: Colors.white,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${viewModel.errorMsg ?? ''}',textAlign: TextAlign.center,style: TextStyle(color: Colors.redAccent),),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
          
                  ),
                  controller: viewModel.email,
                  validator: viewModel.commonValidator,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
          
                  ),
                  controller: viewModel.name,
                  validator: viewModel.commonValidator,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contact',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
          
                  ),
                  controller: viewModel.contact,
                  validator: viewModel.commonValidator,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: (viewModel.hidePassword)
                          ? const Icon(EvaIcons.eye_off_2_outline)
                          : const Icon(EvaIcons.eye_outline),
                      onPressed: () {
                        viewModel.showPassword();
                      },
                    ),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                  ),

                  obscureText: viewModel.hidePassword,
                  controller: viewModel.password,
                  validator: viewModel.commonValidator,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: (viewModel.hidePassword)
                          ? const Icon(EvaIcons.eye_off_2_outline)
                          : const Icon(EvaIcons.eye_outline),
                      onPressed: () {
                        viewModel.showPassword();
                      },
                    ),
                    labelText: 'Retype Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  obscureText: viewModel.hidePassword,
                  controller: viewModel.confirmPassword,
                  validator: viewModel.commonValidator,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => viewModel.registerUser(context),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.indigoAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already Have Account?"),
                      InkWell(
                          onTap: viewModel.goToRegister,
                          child: const Text(" Login Here", style: TextStyle(color: Colors.blueAccent),))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
