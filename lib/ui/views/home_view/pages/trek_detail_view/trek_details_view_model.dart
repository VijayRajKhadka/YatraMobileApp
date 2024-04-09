
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/core/helper/assets_helper.dart';
import 'package:yatra/services/review_services.dart';
import 'package:yatra/ui/views/home_view/pages/trek_detail_view/trek_map_view.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../services/local_storage_service.dart';
import '../../../../../services/trek_services.dart';

class TrekDetailsViewModel extends BaseViewModel{
  final TrekServices trekServices = locator<TrekServices>();
  final ReviewServices reviewServices = locator<ReviewServices>();
  final LocalStorageService localStorageService= locator<LocalStorageService>();
  final TextEditingController reviewController = TextEditingController();

  double? rate;
  final int _reviewPageSize=7;
  final PagingController <int,dynamic> pagingController = PagingController(firstPageKey: 1);
  double sliderValue = 0.0;

  Future<void> fetchPage(int pageKey, int trekId)async{
    final newItem=await reviewServices.getReviewData(trekId,page: pageKey, isTrek: true);
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
  postTrekReview(int trekId){
    if(reviewController.text.trim().isEmpty || reviewController.text.trim()==null){
      EasyLoading.showToast("Pheri Hal");
    }
    else{
      EasyLoading.show(indicator: Image.asset(AssetsHelper.loader, width: 50,height: 50,), status: 'Posting...');
      reviewServices.postReview(trekId, reviewController.text.trim(),isTrek: true).then((value)
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

  postTrekRating(int trekId,){
    if(rate!=null) {
      EasyLoading.show(
          indicator: Image.asset(AssetsHelper.loader, width: 50, height: 50,),
          status: 'Posting...');
      reviewServices.postRate(trekId, rate!, 'trek').then((value) {
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
}