import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatra/model/historical_place.dart';
import '../core/helper/api_helper.dart';


class HistoricalPlaceServices {
  final Dio _dio = Dio();

  late FutureProvider<List<HistoricalPlaceModel>> histProvider;

  HistoricalPlaceServices() {
    histProvider = FutureProvider<List<HistoricalPlaceModel>>((ref) => getHistData());
  }

  Future<List<HistoricalPlaceModel>> getHistData() async {
    try {
      final response = await _dio.get('${ApiHelper.baseUrl}historicalPlace');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']; // Corrected access pattern
        List<HistoricalPlaceModel> resList = [];
        for(Map<String, dynamic> jsonData in data) {
          HistoricalPlaceModel model = HistoricalPlaceModel.fromJson(jsonData);
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