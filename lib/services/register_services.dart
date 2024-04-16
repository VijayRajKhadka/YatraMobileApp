import 'package:dio/dio.dart';
import 'package:yatra/core/helper/api_helper.dart';

class RegisterService {
  final Dio _dio = Dio();

  Future<String?> registerUser(
      String name, String email, String contact, String password, String confirmPass, String photoUrl) async {
    try {
      // Create Dio instance
      // Define the URL for the API endpoint
      const String apiUrl = '${ApiHelper.baseUrl}register';

      // Create FormData object and add necessary fields
      FormData formData = FormData.fromMap({
        'email': email,
        'name': name,
        'contact': contact,
        'password': password,
        'confirm_password': confirmPass,
        'profile': await MultipartFile.fromFile(photoUrl,filename: 'user-profile.jpg')
      });

      Response response = await _dio.post(apiUrl, data: formData,
      options: Options(
        headers: {
          'Content-Type':"multipart/form-data"
        }
      ));
      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Handle the response data
        return 'Registration successful';
      } else {
        return response.statusMessage;
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
