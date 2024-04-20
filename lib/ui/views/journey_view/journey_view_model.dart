import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/helper/voice_helper.dart';

class JourneyViewModel extends BaseViewModel{
  final PageController pageController = PageController();
  final NavigationService navigationService = NavigationService();
  final VoiceHelper voiceHelper = VoiceHelper();

  int currentIndex =0;

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
  gotBack(){
    navigationService.back();
    voiceHelper.stop();
  }

}