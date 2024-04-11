
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../app/app.router.dart';
import '../../../../../core/helper/assets_helper.dart';
import '../../../../../core/helper/voice_helper.dart';
import '../../../../../services/review_services.dart';
import '../trek_detail_view/trek_map_view.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../services/local_storage_service.dart';
import '../../../../../services/restaurant_services.dart';

class RestaurantDetailsViewModel extends BaseViewModel{
  final NavigationService _navigationService = locator<NavigationService>();
  final RestaurantServices restaurantServices = locator<RestaurantServices>();
  final ReviewServices reviewServices = locator<ReviewServices>();
  final LocalStorageService localStorageService= locator<LocalStorageService>();
  final TextEditingController reviewController = TextEditingController();
  final VoiceHelper voiceHelper= VoiceHelper();

  double? rate;
  final int _reviewPageSize=7;
  final PagingController <int,dynamic> pagingController = PagingController(firstPageKey: 1);
  double sliderValue = 0.0;

  void geoMap(double lat, double long){
    _navigationService.navigateToMapView(latitude: lat, longitude: long);
  }

  Future<void> fetchRestaurantReview(int pageKey, int placeId)async{
    final newItem=await reviewServices.getReviewData(placeId,page: pageKey, isRestaurant: true);
    final isLast = newItem.length<_reviewPageSize;
    if(isLast){
      pagingController.appendLastPage(newItem);
    }else{
      final nextPageKey=pageKey+1;
      pagingController.appendPage(newItem, nextPageKey);
    }
  }


  showMap(BuildContext context, String imageUrl){
    Navigator.push(context,MaterialPageRoute(builder: (context)=> ShowMapView(imageUrl: imageUrl,)));
  }
  postTrekReview(int restaurantId){
    if(reviewController.text.trim().isEmpty || reviewController.text.trim()==null){
      EasyLoading.showToast("Pheri Hal");
    }
    else{
      EasyLoading.show(indicator: Image.asset(AssetsHelper.loader, width: 50,height: 50,), status: 'Posting...');
      reviewServices.postReview(restaurantId, reviewController.text.trim(),isRestaurant: true).then((value)
      {
        if(value==1){
          pagingController.refresh();
          reviewController.clear();
          EasyLoading.dismiss();
          EasyLoading.showToast('Thank You For Review');
        }
      }).onError((error, stackTrace){
        EasyLoading.dismiss();
        print(error);
        EasyLoading.showToast("Sorry, We could post your Feedback");
      });
    }
  }

  postTrekRating(int placeId,){
    if(rate!=null) {
      EasyLoading.show(
          indicator: Image.asset(AssetsHelper.loader, width: 50, height: 50,),
          status: 'Posting...');
      reviewServices.postRate(placeId, rate!,'place').then((value) {
        if (value == 1) {
          pagingController.refresh();
          EasyLoading.dismiss();
          EasyLoading.showToast('Thank You For Review');
        }
      }).onError((error, stackTrace) {
        EasyLoading.dismiss();
        EasyLoading.showToast("Sorry, We could post your Feedback");
      });
    }else{
      EasyLoading.showToast("Pheri Hal");
    }
  }


  Color chooseColor(String affordability) {
    switch (affordability) {
      case 'Cheap':
        return Colors.green;
      case 'Budget-Friendly':
        return Colors.blue;
      default:
        return Colors.red;
    }
  }

}