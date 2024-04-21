import 'package:dio/dio.dart';
import 'package:yatra/core/helper/api_helper.dart';

class RegisterService {
  final Dio _dio = Dio();

  Future<bool?> registerUser(String name, String email, String contact,
      String password, String confirmPass, String photoUrl) async {
      try {
        FormData formData = FormData.fromMap({
          'email': email,
          'name': name,
          'contact': contact,
          'password': password,
          'confirm_password': confirmPass,
          'profile':
          await MultipartFile.fromFile(photoUrl, filename: 'user-profile.jpg')
        });
        const String apiUrl = '${ApiHelper.baseUrl}register';
        Response response = await _dio.post(apiUrl,
            data: formData,
            options: Options(headers: {'Content-Type': "multipart/form-data"}));
        if (response.statusCode == 200) {
          return true;
        } else {
          print('Unexpected status code: ${response.statusCode}');
          return false;
        }
      }catch(error){
        if (error is DioError && error.response != null && error.response!.statusCode == 400) {
          return false;
        }
      }
  }

}
