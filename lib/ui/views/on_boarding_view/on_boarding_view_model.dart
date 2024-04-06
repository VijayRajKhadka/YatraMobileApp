import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/app/app.router.dart';

import '../../../core/helper/assets_helper.dart';

class OnBoardingViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  final NavigationService navigationService = NavigationService();
  int currentIndex =0;

  List<Widget> pages = [
    Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AssetsHelper.logo),
        const Text(
          "WELCOME TO YATRA",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("your ultimate Guide to Nepal. ")
      ],
    )),
    Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AssetsHelper.onboard1),
        const Text(
          "NEPALI FOOD",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("authentic and local food awaits you")
      ],
    )),
    Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AssetsHelper.onboard2),
        const Text(
          "TRAVEL NEPAL",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("unleash the true traveling experience")
      ],)),
    Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AssetsHelper.onboard3),
        const Text(
          "EVENTS NEAT YOU",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("update yourself with live events in Nepal")
      ],)),
  ];

  onNext() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
    currentIndex++;
    rebuildUi();
  }

  onPrevious() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
    currentIndex--;
    rebuildUi();
  }
  goToLoginPage(){
    navigationService.navigateToLoginView();
  }
}
