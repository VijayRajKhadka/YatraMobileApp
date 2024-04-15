import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  final _firebaseMessaging  = FirebaseMessaging.instance;

  Future<void> handleBackgroundMessage(RemoteMessage message)async{
    print('Title:${message.notification?.title}');
    print('Title:${message.notification?.body}');

  }
  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission(alert: true, announcement: false, badge: true,
      carPlay: false, provisional: false, sound: true, criticalAlert: false,);
    final fCMToken = await _firebaseMessaging.getToken();
    print ("Token: $fCMToken");

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}