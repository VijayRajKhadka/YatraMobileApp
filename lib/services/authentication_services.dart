import 'package:dio/dio.dart';
import 'package:yatra/app/app.locator.dart';
import 'package:yatra/core/helper/api_helper.dart';
import 'package:yatra/services/local_storage_service.dart';

import '../model/user_auth_model.dart';

class AuthService{
  final Dio _dio = Dio();

  Future<UserAuthModel> login(String email,String password) async {
    try{
      final response= await _dio.post(
        '${ApiHelper.baseUrl}login',
        data: {
          'email': email,
          'password': password
        }
      );
      if(response.statusCode==200){
        return UserAuthModel.fromJson(response.data['data']);
      }
      else{
        throw Exception("Login Failed");
      }
    }catch(e){
      throw Exception("Error while Loggin");
    }
}
}