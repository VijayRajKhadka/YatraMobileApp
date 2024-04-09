import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../model/place_model.dart';
import '../../../../../services/place_services.dart';

class PlaceScreenViewModel extends BaseViewModel{
  final PlaceServices placeServices = locator<PlaceServices>();
  final TextEditingController search = TextEditingController();
  final int _placePageSize=7;

  final PagingController <int,dynamic> pagingController = PagingController(firstPageKey: 1);

  Future<void> fetchPage(int pageKey)async {
    final newItem = await placeServices.getPaginatingData(page: pageKey);
    final isLast = newItem.length < _placePageSize;
    if (isLast) {
      pagingController.appendLastPage(newItem);
    } else {
      final nextPageKey = pageKey + 1;
      pagingController.appendPage(newItem, nextPageKey);
    }
  }

  goToPlace(PlaceModel placeModel){

  }
}