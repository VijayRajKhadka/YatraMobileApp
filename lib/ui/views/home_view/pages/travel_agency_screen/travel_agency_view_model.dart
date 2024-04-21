import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/app/app.locator.dart';
import 'package:yatra/app/app.router.dart';
import 'package:yatra/model/travel_agency_model.dart';
import 'package:yatra/services/travel_agency_services.dart';

class TravelAgencyViewModel extends BaseViewModel{
  final TravelAgencyServices travelAgencyServices = locator<TravelAgencyServices>();
  final NavigationService navigationService = locator<NavigationService>();

  showAgency(TravelAgency travelAgency){
    navigationService.navigateToTravelAgencyDetailView(travelAgency:travelAgency );
  }
}