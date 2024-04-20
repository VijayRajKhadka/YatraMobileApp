import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/app/app.router.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../core/helper/voice_helper.dart';
import '../../../../../services/historical_place_services.dart';
import '../trek_detail_view/trek_map_view.dart';

class HistoricalPlaceViewModel extends BaseViewModel{
  final HistoricalPlaceServices historicalPlaceServices = locator<HistoricalPlaceServices>();
  final VoiceHelper voiceHelper = VoiceHelper();
  final NavigationService navigationService =NavigationService();

  void geoMap(double lat, double long){
    navigationService.navigateToMapView(latitude: lat, longitude: long);
  }
  startJourney(historicalPlaceViewModel){
    navigationService.navigateToJourneyView(historicalPlaceModel: historicalPlaceViewModel);
  }
  showMap(BuildContext context, String imageUrl){
    Navigator.push(context,MaterialPageRoute(builder: (context)=> ShowMapView(imageUrl: imageUrl,)));
  }
}