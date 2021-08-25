import 'package:ae_stagram_app/app/controller/auth/auth_controller.dart';
import 'package:ae_stagram_app/app/data/provider/base_client.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class AuthReposiory {
  late var _dio;

  AuthReposiory() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://34.64.148.156:8080",
        headers: BaseClient.getHeader(),
      ),
    );
  }
}
