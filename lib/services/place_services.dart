import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatra/model/trek_model.dart';
import '../core/helper/api_helper.dart';
import '../model/place_model.dart';

class PlaceServices {
  final Dio _dio = Dio();

  late FutureProvider<List<PlaceModel>>placeProvider;
  late FutureProviderFamily<PlaceDetailsModel, int> placeDetailProvider;

  PlaceServices() {
    placeProvider = FutureProvider<List<PlaceModel>>((ref)=> getPlaceData());
    placeDetailProvider = FutureProvider.family<PlaceDetailsModel, int>((ref, placeId) => getPlaceDetails(placeId));

  }


  Future<List<PlaceModel>> getPlaceData() async {
    try {
      final response = await _dio.get('${ApiHelper.baseUrl}place');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['data'];
        List<PlaceModel> resList = [];
        for(Map<String, dynamic>  data in data){
          PlaceModel model = PlaceModel.fromJson(data);
          resList.add(model);
        }
        return resList;
      } else {
        throw Exception('Failed to load palce data');
      }
    } catch (e) {

      throw Exception('Failed to connect to the server');
    }
  }

  Future<List<PlaceModel>> getPaginatingData({int page = 1}) async {
    try {
      final response = await _dio.get('${ApiHelper.baseUrl}place?page$page');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['data'];
        List<PlaceModel> resList = [];
        for(Map<String, dynamic>  data in data){
          PlaceModel model = PlaceModel.fromJson(data);
          resList.add(model);
        }
        return resList;
      } else {
        throw Exception('Failed to load palce data');
      }
    } catch (e) {

      throw Exception('Failed to connect to the server');
    }
  }

  Future<PlaceDetailsModel> getPlaceDetails(int placeID) async {
    print('${ApiHelper.baseUrl}placeDetails?place=$placeID');
    try {

      final response = await _dio.get('${ApiHelper.baseUrl}placeDetails?place=$placeID');
      print('${ApiHelper.baseUrl}placeDetails?place=$placeID');
      if (response.statusCode == 200) {
        print(response.data);
        return PlaceDetailsModel.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load trek data');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('connect to the server');
    }
  }
}
