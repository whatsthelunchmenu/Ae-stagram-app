import 'package:ae_stagram_app/app/data/model/header_model.dart';

class ResponseModel {
  Header header;
  dynamic body;

  ResponseModel({
    this.header = const Header(),
    this.body = "",
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      header: Header.fromJson(json['header']),
      body: json['body'],
    );
  }
}
