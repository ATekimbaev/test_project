import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/core/consts/app_consts.dart';
import 'package:test_project/data/models/user_info_model.dart';

class AuthorizationRepository {
  AuthorizationRepository({required this.dio});
  final Dio dio;

  Future<UserInfoModel> authorization(
      {required String email, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await dio.post(
      'localhost:8080/api/v1/auth/login',
      data: {
        "email": email,
        "password": password,
      },
    );
    final UserInfoModel result = UserInfoModel.fromJson(
      response.data,
    );

    await prefs.setString(AppConsts.token, result.tokens?.accessToken ?? '');

    return result;
  }
}
