import 'package:demo/constant/strings.dart';
import 'package:demo/data/services/dio_helper.dart';

class AuthenticationRepo {
  userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async =>
      await DioHelper.postData(
        url: REGISTER,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        },
      );

  userLogin({required email, required password}) async =>
      await DioHelper.postData(
        url: LOGIN,
        data: {
          "email": email,
          "password": password,
        },
      );

  getProfile({required token}) async =>
      await DioHelper.getData(url: PROFILE, token: token);
}
