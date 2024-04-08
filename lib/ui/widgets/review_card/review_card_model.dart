import 'package:stacked/stacked.dart';
import 'package:yatra/services/local_storage_service.dart';

import '../../../app/app.locator.dart';
import '../../../model/user_model.dart';

class ReviewCardViewModel extends BaseViewModel{
  bool isExpanded = false;
  setIsExpanded(){
    isExpanded=!isExpanded;
    rebuildUi();
  }

}