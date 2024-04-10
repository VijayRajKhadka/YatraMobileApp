import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yatra/app/app.router.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../model/restaurant_model.dart';
import '../../../../../services/restaurant_services.dart';

class RestaurantScreenViewModel extends BaseViewModel {
  final RestaurantServices restaurantServices = locator<RestaurantServices>();
  final NavigationService navigationService = locator<NavigationService>();
  final TextEditingController search = TextEditingController();

  final int _placePageSize=7;
  static const int _debounceDuration = 400;
  Timer? _debounceTimer;

  final PagingController <int,dynamic> pagingController = PagingController(firstPageKey: 1);

  List<bool> toggle = [true, false];

  Future<void> fetchPage(int pageKey, String search)async {
    final newItem = await restaurantServices.getPaginatingData(page: pageKey, search);

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
      const Duration(milliseconds: _debounceDuration),
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
    await restaurantServices.getPaginatingData(page: 0, search.text);
    pagingController.refresh();
  }

  goToRestaurant(RestaurantModel restaurantModel){
    navigationService.navigateToRestaurantDetailView(restaurantModel: restaurantModel);
  }

  // Method to toggle category selection
  void toggleCategory(int index) {
    if (index >= 0 && index < toggle.length) {
      for (int i = 0; i < toggle.length; i++) {
        toggle[i] = i == index;
      }
      pagingController.refresh();
    }
  }
}
