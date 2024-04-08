
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatra/model/restaurant_model.dart';
import '../core/helper/api_helper.dart';

class RestaurantServices {

  final Dio _dio = Dio();

  late FutureProvider<List<RestaurantModel>>restaurantProvider;

  RestaurantServices(){
    restaurantProvider = FutureProvider<List<RestaurantModel>>((ref)=> getRestaurantData());
  }


  Future<List<RestaurantModel>> getRestaurantData() async {
    try {
      final response = await _dio.get('${ApiHelper.baseUrl}restaurant');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['data'];
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
}
