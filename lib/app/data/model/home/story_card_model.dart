import 'dart:convert';

import 'package:ae_stagram_app/app/data/model/response_model.dart';

import 'feed_info.dart';

StoryCardModel storyCardModelFromJson(String str) =>
    StoryCardModel.fromJson(json.decode(str));

String storyCardModelToJson(StoryCardModel data) => json.encode(data.toJson());

class StoryCardModel extends ResponseModel {
  StoryCardModel({
    this.hasNextToken = "",
    this.maxResults = 0,
    this.feedInfos = const [],
  });
  String hasNextToken;
  int maxResults;
  List<FeedInfo> feedInfos;

  factory StoryCardModel.fromJson(Map<String, dynamic> json) => StoryCardModel(
        hasNextToken: json['hasNextToken'],
        maxResults: json['maxResults'],
        feedInfos: List<FeedInfo>.from(
          json['feedInfos'].map<FeedInfo>((data) => FeedInfo.fromJson(data)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "hasNextToken": hasNextToken,
        "maxResults": maxResults,
        "feedInfos": feedInfos,
      };
}
