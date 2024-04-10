import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/core/helper/assets_helper.dart';
import 'package:yatra/ui/views/splash_screen_view/splash_screen_view_model.dart';

class SplashScreenView extends StackedView<SplashScreenViewModel> {
  const SplashScreenView({super.key});

  @override
  Widget builder(
      BuildContext context, SplashScreenViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.5, end: 1.0),
        duration: const Duration(seconds: 2),
        curve: Curves.elasticIn,
        builder: (BuildContext context, double scale, Widget? child) {
          return Transform.scale(
            scale: scale,
            child: Center(
              child: Image.asset(AssetsHelper.logo),
            ),
          );

        },
      ),
    );
  }

  @override
  SplashScreenViewModel viewModelBuilder(BuildContext context) =>
      SplashScreenViewModel();

  @override
  void onViewModelReady(SplashScreenViewModel viewModel) {
    viewModel.onStartApp();
    super.onViewModelReady(viewModel);
  }
}
