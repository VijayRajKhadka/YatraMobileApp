import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatra/model/top_contributers_model.dart'; // Assuming this contains your User model
import '../core/helper/api_helper.dart';

class TopUserServices {
  late FutureProvider<List<TopUserModel>> topUserProvider;

  TopUserServices() {
    topUserProvider = FutureProvider<List<TopUserModel>>((ref) => getTopUser());

  }

  Future<List<TopUserModel>> getTopUser() async {
    final Dio dio = Dio();

    try {
      final Response response = await dio.get('${ApiHelper.baseUrl}topContributers');
      if (response.statusCode == 200) {
        return parseUsers(response.data);
      } else {
        throw Exception("Error: ${response.statusCode} ${response.statusMessage}");
      }
    } on DioError catch (e) {
      print("DioError: ${e.message}");
      throw Exception("DioError: ${e.message}");
    } catch (e) {
      print("Error: $e");
      throw Exception("Error: $e");
    }
  }


}
