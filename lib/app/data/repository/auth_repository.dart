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
    final response = await _dio.post(
      '/users/login',
      options: Options(
        headers: header,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      LoggerController.to.logger.i("[Login] Login Success");
    } else {
      LoggerController.to.logger.e("[Login] Login fail : $response");
    }
  }
}
