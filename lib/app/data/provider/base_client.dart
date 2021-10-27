import 'package:ae_stagram_app/app/controller/auth/auth_controller.dart';
import 'package:ae_stagram_app/app/controller/logger/logger_controller.dart';
import 'package:dio/dio.dart';

class BaseClient {
  static BaseOptions baseOptions = BaseOptions(
    baseUrl:
        "http://ec2-13-125-180-18.ap-northeast-2.compute.amazonaws.com:8080",
  );

  static Future<String> getToken() async {
    final user = AuthController.to.user;
    if (user != null) {
      final idToken = user.getIdToken();
      return idToken;
    }
    return "";
  }

  static Future<Map<String, dynamic>> getHeader() async {
    String token = await getToken();
    LoggerController.to.logger.i("[getHeader] : getToken");
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token',
    };
  }

  static Future<Map<String, dynamic>> getMultiPartHeader() async {
    String token = await getToken();
    LoggerController.to.logger.i("[getMultiPartHeader] : getToken");
    return {
      // 'Content-Type': 'multipart/form-data',
      // 'Accept': 'application/json',
      'Authorization': '$token',
    };
  }
}
