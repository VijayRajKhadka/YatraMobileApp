import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:yatra/core/helper/api_helper.dart';

import '../../app/app.locator.dart';
import '../../services/local_storage_service.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

  }

  Future<void> initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<void> initNotification() async {
    final LocalStorageService localStorageService = LocalStorageService();

    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      provisional: false,
      sound: true,
      criticalAlert: false,
    );
    final fCMToken = await _firebaseMessaging.getToken();
    print(fCMToken);
    if(await localStorageService.getNotificationToken()){
      await storeFCMToken(fCMToken);
    }
    initPushNotification();
  }

  Future<void> storeFCMToken(token) async {
    final Dio dio = Dio();
    final LocalStorageService localStorageService = LocalStorageService();

    try {
      FormData formData = FormData.fromMap({
        'token': token,
      });
      print("posting");
      final response = await dio.post('${ApiHelper.baseUrl}saveToken', data: formData);
      print('Token stored successfully: $response');
      if (response.statusCode == 200) {
        print('Token stored successfully: ${response.data}');
        localStorageService.setNotificationToken(token);
      } else {
        print('Failed to store token: ${response.statusCode}');
      }
    } catch (e) {
      // Any other errors
      print('Error: $e');
    }
  }

  }

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Title: ${message.notification?.body}');
}
