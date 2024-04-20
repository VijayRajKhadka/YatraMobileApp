import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatra/model/event_model.dart';

import '../core/helper/api_helper.dart';

class EventServices{
  final Dio _dio=Dio();
  late FutureProvider<List<TravelEventModel>> travelEventProvider;
  late FutureProvider<List<RestaurantEventModel>> restaurantventProvider;


  EventServices() {
    travelEventProvider = FutureProvider<List<TravelEventModel>>((ref) => getTravelEvents());
    restaurantventProvider = FutureProvider<List<RestaurantEventModel>>((ref) => getRestaurantEvents());

  }

  Future<List<TravelEventModel>> getTravelEvents() async {
    try {
      final response = await _dio.get('${ApiHelper.baseUrl}travelEvents');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        List<TravelEventModel> resList = [];
        for(Map<String, dynamic> jsonData in data) {
          TravelEventModel model = TravelEventModel.fromJson(jsonData);
          resList.add(model);
        }
        return resList;
      } else {
        throw Exception('Failed to load historical place data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to connect to the server');
    }
  }

  Future<List<RestaurantEventModel>> getRestaurantEvents() async {
    try {
      final response = await _dio.get('${ApiHelper.baseUrl}restaurantEvents');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        List<RestaurantEventModel> resList = [];
        for(Map<String, dynamic> jsonData in data) {
          RestaurantEventModel model = RestaurantEventModel.fromJson(jsonData);
          resList.add(model);
        }
        return resList;
      } else {
        throw Exception('Failed to load historical place data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to connect to the server');
    }
  }
}