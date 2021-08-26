import 'package:ae_stagram_app/app/controller/controllers.dart';
import 'package:ae_stagram_app/app/data/provider/base_client.dart';
import 'package:dio/dio.dart';

class AuthReposiory {
  late Dio _dio;

  AuthReposiory() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://34.64.148.156:8080",
      ),
    );
  }

  Future login() async {
    Map<String, dynamic> header = await BaseClient.getHeader();
    try {
      await _dio.post('/user/login', options: Options(headers: header));
      LoggerController.to.logger.i("[Login] Login Sucess");
    } catch (e) {
      LoggerController.to.logger.e("[Login] Login fail : $e");
    }
  }
}
