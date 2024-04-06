import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/ui/views/home_view/common/top_nav_view/top_nav_view.dart';
import 'package:yatra/ui/views/home_view/home_view_model.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {

    return Scaffold(

        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined), label: "Events"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          currentIndex: viewModel.currentIndex,
          onTap: (value) => viewModel.onChangeTab(value),
        ),
      body:PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: viewModel.pageController,
        itemCount: viewModel.pages.length,
        itemBuilder: (context, index) {
        return viewModel.pages[viewModel.currentIndex];
      },),
        );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
