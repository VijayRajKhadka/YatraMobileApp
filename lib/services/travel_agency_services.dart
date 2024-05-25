import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/helper/api_helper.dart';
import '../model/travel_agency_model.dart';

class TravelAgencyServices {
  final Dio _dio=Dio();
  late FutureProvider<List<TravelAgency>> travelAgencyProvider;

  TravelAgencyServices() {
    travelAgencyProvider = FutureProvider<List<TravelAgency>>((ref) => getTravelAgency());
  }

  Future<List<TravelAgency>> getTravelAgency() async {
    try {
      final response = await _dio.get('${ApiHelper.baseUrl}travelAgency');
      if (response.statusCode == 200) {
        if (response.data.containsKey('data')) {
          List<dynamic> data = response.data['data'];
          List<TravelAgency> resList = [];
          for (Map<String, dynamic> jsonData in data) {
            TravelAgency model = TravelAgency.fromJson(jsonData);
            resList.add(model);
          }
          return resList;
        } else {
          throw Exception('No data found in the response');
        }
      } else {
        throw Exception('Failed to load travel agency data: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to connect to the server');
    }
  }

}