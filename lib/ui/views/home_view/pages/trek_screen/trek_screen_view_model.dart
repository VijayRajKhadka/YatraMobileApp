import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
  final int _trekPageSize=7;

  final PagingController <int,dynamic> pagingController = PagingController(firstPageKey: 1);

  Future<void> fetchPage(int pageKey, String search)async {
    final newItem = await trekServices.getPaginatingData(page: pageKey, search);

    final isLast = newItem.length < _trekPageSize;
    if (isLast) {
      pagingController.appendLastPage(newItem);
    } else {
      final nextPageKey = pageKey + 1;
      pagingController.appendPage(newItem, nextPageKey);
    }
  }

  goToTrek(TrekModel trekModel) {
    navigationService.navigateToTrekDetailsView(trekModel: trekModel);
  }
  Future<void> searchTrek(String query) async {
    print(search.text);
    search.text=query;
    rebuildUi();
  }
  searchNow()async{
    await trekServices.getPaginatingData(page:0, search.text);
    pagingController.refresh();

  }
}