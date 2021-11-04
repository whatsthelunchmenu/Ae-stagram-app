import 'dart:io';

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

  Future getStory(String nextToken) async {
    Map<String, dynamic> header = await BaseClient.getHeader();
    try {
      Response response = await _dio.get(
        '/feeds',
        options: Options(
          headers: header,
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
    } on DioError catch (e) {
      LoggerController.to.logger
          .e("[GetStory] request error : ${e.response?.data}");
    }
    return ResponseModel();
  }

  Future<bool> deleteStory(int id) async {
    Map<String, dynamic> header = await BaseClient.getHeader();
    try {
      Response response = await _dio.delete(
        '/feeds/$id',
        options: Options(headers: header),
      );
      if (response.statusCode == 200) {
        final jsonResult = ResponseModel.fromJson(response.data);
        LoggerController.to.logger
            .i("[DeleteStory] request success : ${jsonResult.header.message}");
        return true;
      } else {
        LoggerController.to.logger.e(
            "[DeleteStory] request fail : ${response.statusCode} | ${response.statusMessage}");
        return false;
      }
    } on DioError catch (e) {
      LoggerController.to.logger
          .e("[DeleteStory] request error : ${e.response?.data}");
    }
    return false;
  }

  Future<bool> modifyStory(int id, String content, List<File> images) async {
    var formData = FormData();
    for (var file in images) {
      final String fileName = file.path.split('/').last;
      formData.files.addAll([
        MapEntry('images',
            await MultipartFile.fromFile(file.path, filename: fileName))
      ]);
    }
    formData.fields.add(MapEntry('content', content));
    formData.fields.add(MapEntry('id', id.toString()));
    await BaseClient.getMultiPartHeader().then((header) async {
      try {
        Response response = await _dio.patch('/feeds/$id',
            options: Options(headers: header), data: formData);
        if (response.statusCode == 200) {
          final jsonResult = ResponseModel.fromJson(response.data);
          LoggerController.to.logger.i(
              "[ModifyStory] request success : ${jsonResult.header.message}");
          return true;
        } else {
          LoggerController.to.logger.e(
              "[ModifyStory] request fail : ${response.statusCode} | ${response.statusMessage}");
          return false;
        }
      } on DioError catch (e) {
        LoggerController.to.logger
            .e("[ModifyStory] request error : ${e.response?.data}");
      }
    });
    return false;
  }
}
