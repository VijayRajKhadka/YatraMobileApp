import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/app/app.router.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../model/place_model.dart';
import '../../../../../services/place_services.dart';

class PlaceScreenViewModel extends BaseViewModel{
  final PlaceServices placeServices = locator<PlaceServices>();
  final NavigationService navigationService = locator<NavigationService>();
  final TextEditingController search = TextEditingController();
  final int _placePageSize=7;
  static const int _debounceDuration = 400;
  Timer? _debounceTimer;

  final PagingController <int,dynamic> pagingController = PagingController(firstPageKey: 1);

  Future<void> fetchPage(int pageKey, String search)async {
    final newItem = await placeServices.getPaginatingData(page: pageKey, search);

    final isLast = newItem.length < _placePageSize;
    if (isLast) {
      pagingController.appendLastPage(newItem);
    } else {
      final nextPageKey = pageKey + 1;
      pagingController.appendPage(newItem, nextPageKey);
    }
  }
  void debounceSearch(String query) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(
      Duration(milliseconds: _debounceDuration),
          () {
        searchNow();
      },
    );
  }

  Future<void> searchTrek(String query) async {
    print(query);
    debounceSearch(query);
  }

  searchNow() async {
    await placeServices.getPaginatingData(page: 0, search.text);
    pagingController.refresh();
  }

  goToPlace(PlaceModel placeModel){
  navigationService.navigateToPlaceDetailView(placeModel: placeModel);
}


}