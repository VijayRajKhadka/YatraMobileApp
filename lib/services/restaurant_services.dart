
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatra/model/restaurant_model.dart';
import '../core/helper/api_helper.dart';

class RestaurantServices {

  final Dio _dio = Dio();

  late FutureProviderFamily<List<RestaurantModel>,String>restaurantProvider;
  late FutureProviderFamily<RestaurantDetailsModel, int> restaurantDetailProvider;

  RestaurantServices(){

    restaurantProvider = FutureProvider.family<List<RestaurantModel>,String>((ref,search)=> getRestaurantData(search));
    restaurantDetailProvider = FutureProvider.family<RestaurantDetailsModel, int>((ref, restaurantId) => getRestaurantDetails(restaurantId));

  }


  Future<List<RestaurantModel>> getRestaurantData(String search) async {
    try {
      final response = await _dio.get('${ApiHelper.baseUrl}restaurant');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['data'];
        print(response.data);
        List<RestaurantModel> resList = [];
        for(Map<String, dynamic>  data in data){
          RestaurantModel model = RestaurantModel.fromJson(data);
          resList.add(model);
        }
        return resList;
      } else {
        throw Exception('Failed to load trek data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<List<RestaurantModel>> getPaginatingData(String search,{int page = 1}) async {
    try {
      final response = await _dio.get('${ApiHelper.baseUrl}restaurant?search=${search ?? ""}');
      print('${ApiHelper.baseUrl}restaurant?search=${search ?? ""}');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['data'];
        List<RestaurantModel> resList = [];
        for(Map<String, dynamic>  data in data){
          RestaurantModel model = RestaurantModel.fromJson(data);
          resList.add(model);
        }
        return resList;
      } else {
        throw Exception('Failed to load place data');
      }
    } catch (e) {

      throw Exception('Failed to connect to the server');
    }
  }

  Future<RestaurantDetailsModel> getRestaurantDetails(int restaurantID) async {
    try {
      print('${ApiHelper.baseUrl}restaurantDetails?restaurant=$restaurantID');
      final response = await _dio.get('${ApiHelper.baseUrl}restaurantDetails?restaurant=$restaurantID');
      print(response.data);

      if (response.statusCode == 200) {
        return RestaurantDetailsModel.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load trek data');
      }
    } catch (e) {
      print(e);
      throw Exception('connect to the server');
    }
  }
}
