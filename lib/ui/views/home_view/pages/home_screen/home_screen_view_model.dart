import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/app/app.router.dart';
import 'package:yatra/model/trek_model.dart';
import 'package:yatra/services/restaurant_services.dart';
import 'package:yatra/services/trek_services.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../services/place_services.dart';

class HomeScreenViewModel extends BaseViewModel {
  final TrekServices trekServices = locator<TrekServices>();
  final NavigationService navigationService = locator<NavigationService>();
  final RestaurantServices restaurantServices = locator<RestaurantServices>();
  final PlaceServices placeServices = locator<PlaceServices>();

  goToTrek(TrekModel trekModel) {
    navigationService.navigateToTrekDetailsView(trekModel: trekModel);
  }
}