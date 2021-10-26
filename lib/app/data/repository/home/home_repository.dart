import 'package:ae_stagram_app/app/controller/logger/logger_controller.dart';
import 'package:ae_stagram_app/app/data/model/home/story_card_model.dart';
import 'package:ae_stagram_app/app/data/model/response_model.dart';
import 'package:ae_stagram_app/app/data/provider/base_client.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  late Dio _dio;

  HomeRepository() {
    _dio = Dio(BaseClient.baseOptions);
  }

  Future<bool> createStory(String content, List<String> images) async {
    await BaseClient.getHeader().then(
      (value) async {
        try {
          Response response = await _dio.post(
            '/feeds',
            options: Options(
              headers: value,
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
      },
    );
    return false;
  }

  Future getStory(String nextToken) async {
    await BaseClient.getHeader().then(
      (value) async {
        try {
          Response response = await _dio.get(
            '/feeds',
            options: Options(
              headers: value,
            ),
            queryParameters: {
              "nextToken": nextToken,
            },
          );
          if (response.statusCode == 200) {
            final jsonResult = ResponseModel.fromJson(response.data);
            LoggerController.to.logger
                .i("[GetStory] request success : ${jsonResult.header.message}");
            return StoryCardModel.fromJson(jsonResult.body);
          } else {
            LoggerController.to.logger.e(
                "[GetStory] request fail : ${response.statusCode} | ${response.statusMessage}");
            return ResponseModel();
          }
        } catch (e) {
          LoggerController.to.logger
              .e("[GetStory] request error : ${e.toString()}");
        }
      },
    );
    return ResponseModel();
  }
}
