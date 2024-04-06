import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatra/model/trek_model.dart';
import '../core/helper/api_helper.dart';

class TrekServices {

  final Dio _dio = Dio();


  Future<List<TrekModel>> getTrekData() async {
    try {
      final response = await _dio.get('${ApiHelper.baseUrl}trek');
      if (response.statusCode == 200) {
        print(response);
        List<dynamic> data = response.data['data'];
        return data.map((json) => TrekModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load trek data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}
