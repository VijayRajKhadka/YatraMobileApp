import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatra/model/review_model.dart'; // Assuming you have a ReviewModel defined
import 'package:yatra/services/local_storage_service.dart';
import '../app/app.locator.dart';
import '../core/helper/api_helper.dart';

class ReviewServices {
  final _dio = Dio(BaseOptions(
    followRedirects: true,
    maxRedirects: 5, // Example value, adjust as needed
  ));

  final LocalStorageService _localStorageService = locator<
      LocalStorageService>();


  Future<List<ReviewModel>> getReviewData(int id, {int page = 1,bool isTrek = false,
    isPlace = false,
    isRestaurant = false,
    isHistoricalPlace = false}) async {
    String endpoint;
    if (isTrek) {
      endpoint = 'trekReview?trek=$id';
    } else if (isPlace) {
      endpoint = 'placeReview?place=$id';
    } else if (isRestaurant) {
      endpoint = 'restaurantReview?restaurant=$id';
    } else if (isHistoricalPlace) {
      endpoint = 'historicalPlacesReview?restaurant=$id';
    }
    else {
      endpoint = '';
    }
    try {
      print('${ApiHelper.baseUrl}$endpoint&page=$page');
      final response = await _dio
          .get('${ApiHelper.baseUrl}$endpoint&page=$page');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['data'];
        List<ReviewModel> resList = [];
        for (Map<String, dynamic> reviewData in data) {
          ReviewModel model = ReviewModel.fromJson(
              reviewData); // Assuming ReviewModel.fromJson exists
          resList.add(model);
        }
        return resList;
      } else {
        throw Exception('Failed to load review data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<int> postReview(int id, String review,
      {bool isTrek = false,
        isPlace = false,
        isRestaurant = false,
        isHistoricalPlace = false}) async {
    String endpoint;
    String type;
    if (isTrek) {
      endpoint = 'addTrekFeedback?trek=$id';
      type = 'trek_id';
    } else if (isPlace) {
      endpoint = 'addPlaceFeedback?place=$id';
      type = 'place_id';
    } else if (isRestaurant) {
      endpoint = 'addRestaurantFeedback?restaurant=$id';
      type = 'restaurant_id';
    } else if (isHistoricalPlace) {
      endpoint = 'addHistoricalPlacesFeedback?restaurant=$id';
      type = 'historicalPLace_id';
    }
    else {
      endpoint = '';
      type='';
    }
    FormData data = FormData.fromMap({
      'user_id': await _localStorageService.getUserData().then((value) =>
      value.id),
      'review': review,
      type: id
    });

    try {
      final response = await _dio
          .post('${ApiHelper.baseUrl}$endpoint',
          data:data);
      if(response.statusCode==200){
        return 1;
      }
      else{
        throw Exception('Failed to post review data');
      }
    } catch (e) {
      throw Exception('Sorry,Failed to post review data');
    }

  }

  Future<int> postRate(int id, double rate, String type,
      {bool isTrek = false,
        isPlace = false,
        isRestaurant = false,
        isHistoricalPlace = false}) async {
    String endpoint;
    if (type=='trek') {
      endpoint = 'addTrekFeedback?trek=$id';
      type='trek_id';
    } else if (type=='place') {
      endpoint = 'addPlaceFeedback?place=$id';
      type='place_id';
    } else if (type=='restaurant') {
      endpoint = 'addRestaurantFeedback?restaurant=$id';
      type='restaurant_id';

    } else if (type=='historicalPlace') {
      endpoint = 'addHistoricalPlacesFeedback?restaurant=$id';
      type = 'historicalPLace_id';
    }
    else {
      endpoint = '';
      type='';
    }
    FormData data = FormData.fromMap({
      'user_id': await _localStorageService.getUserData().then((value) =>
      value.id),
      'rating': rate,
      type: id
    });

    try {
      print('${ApiHelper.baseUrl}$endpoint');
      final response = await _dio
          .post('${ApiHelper.baseUrl}$endpoint',
          data:data,);
      if(response.statusCode==200){
        return 1;
      }
      else{
        throw Exception('Failed to post rate data');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Sorry,Failed to post rate data');
    }

  }
}
