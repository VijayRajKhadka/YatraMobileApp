import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/app/app.router.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../model/trek_model.dart';
import '../../../../../services/trek_services.dart';

class TrekScreenViewModel extends BaseViewModel{
  final TrekServices trekServices = locator<TrekServices>();
  final NavigationService navigationService = locator<NavigationService>();
  final TextEditingController search = TextEditingController();

  goToTrek(TrekModel trekModel) {
    navigationService.navigateToTrekDetailsView(trekModel: trekModel);
  }
  void searchTrek(String query) {
    print(query);
    print(search.text);
    print(trekServices.getTrekData(search.text));
    rebuildUi();
  }

}