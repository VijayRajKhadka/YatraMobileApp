import 'package:dio/dio.dart';

import '../core/helper/api_helper.dart';
import '../model/user_model.dart';

class UserAuthServices{

  final Dio _dio = Dio();
  Future<UserModel> getUserInfo(String token) async {
    try{
      final response= await _dio.get(
          '${ApiHelper.baseUrl}user',
          options: Options(
            headers:{ 'Authorization': 'Bearer $token'
            },
          )
      );
      if(response.statusCode==200){
        return UserModel.fromJson(response.data);
      }
      else{
        throw Exception("Error fetching User Data");
      }
    }catch(e){
      throw Exception("Error while Fetching");
    }
  }
}