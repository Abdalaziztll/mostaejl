// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
// import 'package:herry_up/core/config/dependency_injection.dart';
import 'package:herry_up/core/data/model/user.dart';
import 'package:herry_up/core/data/service/base_service.dart';
// import 'package:herry_up/task1/view/signup_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthService extends BaseService {
  @override
  // ignore: overridden_fields
  Dio dio = Dio();
  String baseURL = 'https://dummyjson.com/auth/login';

  signUP(UserModel user);
}

class AuthServiceImpl extends AuthService {
  @override
  signUP(UserModel user) async {
    print(user.toJson());
    Response response = await dio.post(baseURL, data: user.toJson());

    if (response.statusCode == 200) {
      // print(response.data);
      // String token = response.data['token'];
      // storage.get<SharedPreferences>().setString('token', token);
      return true;
    } else {
      print('Error');
      return false;
    }
  }
}
