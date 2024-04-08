import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatra/model/trek_model.dart';
import '../core/helper/api_helper.dart';

class TrekServices {

  final Dio _dio = Dio();

  late FutureProvider<List<TrekModel>>trekProvider;
  late FutureProviderFamily<TrekDetailsModel,int>trekDetailProvider;

  TrekServices(){
    trekProvider = FutureProvider<List<TrekModel>>((ref)=> getTrekData());
    trekDetailProvider = FutureProvider.family<TrekDetailsModel,int>((ref,trekID)=> getTrekDetails(trekID));
  }


  Future<List<TrekModel>> getTrekData() async {
    try {
      final response = await _dio.get('${ApiHelper.baseUrl}trek');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['data'];
        List<TrekModel> resList = [];
        for(Map<String, dynamic>  data in data){
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
