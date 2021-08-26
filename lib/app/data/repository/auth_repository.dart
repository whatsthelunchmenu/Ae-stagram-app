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

  Future getTest() async {
    Map<String, dynamic> header = await BaseClient.getHeader();
    final response = await _dio.get('/api', options: Options(headers: header));
    print(response);
  }
}
