import 'package:ae_stagram_app/app/controller/logger/logger_controller.dart';
import 'package:ae_stagram_app/app/data/model/response_model.dart';
import 'package:ae_stagram_app/app/data/provider/base_client.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  late Dio _dio;

  HomeRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://34.64.148.156:8080",
      ),
    );
  }

  Future<bool> createStory(
      String content, List<Map<String, dynamic>> images) async {
    Map<String, dynamic> header = await BaseClient.getHeader();
    try {
      Response response = await _dio.post(
        '/feeds',
        options: Options(
          headers: header,
        ),
        data: {
          "id": null,
          "content": content,
          "images": images,
        },
      );
      if (response.statusCode == 200) {
        final jsonResult = ResponseModel.fromJson(response.data);
        LoggerController.to.logger
            .i("[CreateStory] request Success : ${jsonResult.header}");
        return true;
      } else {
        LoggerController.to.logger.e(
            "[CreateStory] request fail : ${response.statusCode} | ${response.statusMessage}");
        return false;
      }
    } catch (e) {
      LoggerController.to.logger
          .e("[CreateStory] request error : ${e.toString()}");
    }
    return false;
  }

  Future getStory() async {
    Map<String, dynamic> header = await BaseClient.getHeader();
    try {
      Response response = await _dio.get(
        '/feeds',
        options: Options(
          headers: header,
        ),
      );
      if (response.statusCode == 200) {
        final jsonResult = ResponseModel.fromJson(response.data);
        LoggerController.to.logger
            .i("[GetStory] request success : ${jsonResult.header.message}");
        return jsonResult;
      } else {
        LoggerController.to.logger.e(
            "[GetStory] request fail : ${response.statusCode} | ${response.statusMessage}");
        return ResponseModel();
      }
    } catch (e) {
      LoggerController.to.logger
          .e("[GetStory] request error : ${e.toString()}");
    }
    return ResponseModel();
  }
}
