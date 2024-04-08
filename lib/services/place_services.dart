import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatra/model/trek_model.dart';
import '../core/helper/api_helper.dart';
import '../model/place_model.dart';

class PlaceServices {

  final Dio _dio = Dio();

  late FutureProvider<List<PlaceModel>>placeProvider;

  PlaceServices(){
    placeProvider = FutureProvider<List<PlaceModel>>((ref)=> getPlaceData());
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
}
