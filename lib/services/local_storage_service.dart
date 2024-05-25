import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class LocalStorageService{
  late SharedPreferences _localStr ;

  LocalStorageService(){
    _initStorage();
  }
  _initStorage() async{
    _localStr = await SharedPreferences.getInstance();
  }

  setInitialAppRun() async {
     await _localStr.setBool('initialAppRun',false);
  }

  getInitialAppRun() async {
    bool? initialAppRun = _localStr.getBool('initialAppRun');
    return initialAppRun;
  }

  setToken(String token) async{
    await _localStr.setString('userToken', token);
  }

  getToken()  {
    String? token = _localStr.getString('userToken');
    return token;
  }
  deleteToken()async{
    await _localStr.remove('userToken');
  }

  setNotificationToken(String notificationToken)async {
    await _localStr.setString('notificationToken', notificationToken);
  }
  getNotificationToken()  {
    String? notificationToken = _localStr.getString('notificationToken');
    if(notificationToken == null){
    return true;
    } else{
      return false;
    }
  }

  setUserData(Map<String,dynamic> userData) async{
    await _localStr.setInt('id',userData['id']);
    await _localStr.setInt('contact',userData['contact']);
    await _localStr.setString('name',userData['name']);
    await _localStr.setString('email',userData['email']);
    await _localStr.setString('profile',userData['profile']);
    await _localStr.setString('profile_url',userData['profile_url']);
    await _localStr.setString('created_at',userData['created_at']);
    await _localStr.setString('updated_at',userData['updated_at']);
    await _localStr.setString('emailVerifiedAt',userData['emailVerifiedAt']??'');
  }

  Future<void> clearUserData() async {
    await _localStr.remove('id');
    await _localStr.remove('contact');
    await _localStr.remove('name');
    await _localStr.remove('email');
    await _localStr.remove('profile');
    await _localStr.remove('profile_url');
    await _localStr.remove('created_at');
    await _localStr.remove('updated_at');
    await _localStr.remove('emailVerifiedAt');
  }


  Future<UserModel> getUserData() async{
    int? id = _localStr.getInt('id');
    int? contact = _localStr.getInt('contact');
    String? name = _localStr.getString('name');
    String? email = _localStr.getString('email');
    String? profile = _localStr.getString('profile');
    String? profile_url = _localStr.getString('profile_url');
    String? created_at = _localStr.getString('created_at');
    String? updated_at = _localStr.getString('updated_at');
    String? emailVerifiedAt = _localStr.getString('emailVerifiedAt');

    return UserModel(id: id!,name: name!,contact: contact!,email: email!,profileUrl: profile_url!
    ,createdAt: created_at!, profile: profile!, updatedAt: updated_at!,emailVerifiedAt: emailVerifiedAt);
  }
}