import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/services/top_contributers_services.dart';

import '../../../../../app/app.locator.dart';

class TopUserViewModel extends BaseViewModel{
  final TopUserServices topUserServices = locator<TopUserServices>();
  final NavigationService _navigationService = locator<NavigationService>();
}