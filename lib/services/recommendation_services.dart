import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/helper/api_helper.dart';
import '../model/recommendedTrek.dart';

class RecommendationServices {
  final Dio _dio = Dio();


  Future<List<RecommendationTrek>> getRecommendationData(int budget) async {
    try {
      final response = await _dio.post(
        ApiHelper.mlUrl,
        data: {'budget': budget},
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['prediction'];
        List<RecommendationTrek> trekList = [];
        for (var json in data) {
          RecommendationTrek trek = RecommendationTrek.fromJson(json);
          trekList.add(trek);
        }
        return trekList;
      } else {
        throw Exception('Failed to load trek data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}
