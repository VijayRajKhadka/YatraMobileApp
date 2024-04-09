import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatra/model/trek_model.dart';
import '../core/helper/api_helper.dart';

class TrekServices {

  final Dio _dio = Dio();

  late FutureProviderFamily<List<TrekModel>,String> trekProvider;
  late FutureProviderFamily<TrekDetailsModel, int> trekDetailProvider;

  TrekServices() {
    trekProvider = FutureProvider.family<List<TrekModel>,String>((ref,search) => getTrekData(search));
    trekDetailProvider = FutureProvider.family<TrekDetailsModel, int>((ref, trekID) => getTrekDetails(trekID));
  }

  Future<List<TrekModel>> getPaginatingData(String search,{int page = 1}) async {
    try {
      final response = await _dio.get('${ApiHelper.baseUrl}trek?search=$search&page=$page');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['data'];
        List<TrekModel> resList = [];
        for(Map<String, dynamic> data in data) {
          TrekModel model = TrekModel.fromJson(data);
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

  Future<List<TrekModel>> getTrekData(String? search) async {
    try {
      final response = await _dio.get('${ApiHelper.baseUrl}trek?search=${search ?? ""}');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['data'];
        List<TrekModel> resList = [];
        for(Map<String, dynamic> data in data) {
          TrekModel model = TrekModel.fromJson(data);
          resList.add(model);
        }
        return resList;
      } else {
        throw Exception('Failed to load trek data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to connect to the server');
    }
  }

  Future<TrekDetailsModel> getTrekDetails(int trekID) async {
    try {
      final response = await _dio.get('${ApiHelper.baseUrl}trekDetails?trek=$trekID');
      if (response.statusCode == 200) {
        return TrekDetailsModel.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load trek data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}
