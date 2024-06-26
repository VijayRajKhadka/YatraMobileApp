import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/app/app.router.dart';
import 'package:yatra/model/historical_place.dart';
import 'package:yatra/model/trek_model.dart';
import 'package:yatra/services/historical_place_services.dart';
import 'package:yatra/services/restaurant_services.dart';
import 'package:yatra/services/trek_services.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../model/place_model.dart';
import '../../../../../model/restaurant_model.dart';
import '../../../../../services/place_services.dart';

class HomeScreenViewModel extends BaseViewModel {
  final TrekServices trekServices = locator<TrekServices>();
  final NavigationService navigationService = locator<NavigationService>();
  final RestaurantServices restaurantServices = locator<RestaurantServices>();
  final PlaceServices placeServices = locator<PlaceServices>();
  final HistoricalPlaceServices historicalPlaceServices = locator<HistoricalPlaceServices>();

  goToTrek(TrekModel trekModel) {
    navigationService.navigateToTrekDetailsView(trekModel: trekModel);
  }
  goToPlace(PlaceModel placeModel){
    navigationService.navigateToPlaceDetailView(placeModel: placeModel);
  }
  goToRestaurant(RestaurantModel restaurantModel){
    navigationService.navigateToRestaurantDetailView(restaurantModel: restaurantModel);
  }
  goToHistoricalDetails(HistoricalPlaceModel historicalPlaceModel){
    navigationService.navigateToHistoricalDetailsView(historicalPlaceModel: historicalPlaceModel);
  }

  gotToHomeScreen(){
    navigationService.replaceWithHomeView();
  }
  goToTrekScreen(){
    navigationService.navigateToTrekView();
  }
  goToPlaceScreen(){
    navigationService.navigateToPlaceView();
  }
  goToRestaurantScreen(){
    navigationService.navigateToRestaurantView();
  }
  goToRecommendation(){
    navigationService.navigateToRecommendationView();
  }
  goToEventsScreen(){
    navigationService.navigateToEventScreenView();
  }
  goToTravelAgency(){
    navigationService.navigateToTravelAgencyView();
  }
}