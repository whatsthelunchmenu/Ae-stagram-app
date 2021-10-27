import 'dart:io';
import 'package:ae_stagram_app/app/controller/logger/logger_controller.dart';
import 'package:ae_stagram_app/app/data/model/response_model.dart';
import 'package:ae_stagram_app/app/data/provider/base_client.dart';
import 'package:dio/dio.dart';

class NewStoryRepository {
  late Dio _dio;

  NewStoryRepository() {
    _dio = Dio(BaseClient.baseOptions);
  }

  Future<bool> createStory(String content, List<File> images) async {
    var formData = FormData();
    for (var file in images) {
      final String fileName = file.path.split('/').last;
      formData.files.addAll([
        MapEntry('images',
            await MultipartFile.fromFile(file.path, filename: fileName))
      ]);
    }
    formData.fields.add(MapEntry('content', content));

    await BaseClient.getMultiPartHeader().then(
      (header) async {
        try {
          Response response = await _dio.post(
            '/feeds',
            options: Options(
              headers: header,
            ),
            data: formData,
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
        } on DioError catch (e) {
          LoggerController.to.logger
              .e("[CreateStory] request error : ${e.response?.data}");
        }
      },
    );
    return false;
  }
}
