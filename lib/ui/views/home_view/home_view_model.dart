import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/ui/views/home_view/pages/event_screen/event_screen_view.dart';
import 'package:yatra/ui/views/home_view/pages/home_screen/home_screen_view.dart';
import 'package:yatra/ui/views/home_view/pages/profile_screen/profile_screen_view.dart';

class HomeViewModel extends BaseViewModel{
  int currentIndex=1;
  final PageController pageController = PageController();

  List<Widget> pages =[
    // const Center(child: Text("Add"),),
    // const Center(child: Text("Search"),),

    const EventScreenView(),
    const HomeScreenView(),
    const ProfileScreenView(),

  ];
  onChangeTab(value){
    currentIndex = value;
    rebuildUi();
  }
}