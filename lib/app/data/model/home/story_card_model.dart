import 'dart:convert';

import 'feed_info.dart';

StoryCardModel storyCardModelFromJson(String str) =>
    StoryCardModel.fromJson(json.decode(str));

String storyCardModelToJson(StoryCardModel data) => json.encode(data.toJson());

class StoryCardModel {
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
          json['feedInfos'].map(
            (data) => FeedInfo.fromJson(data),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "hasNextToken": hasNextToken,
        "maxResults": maxResults,
        "feedInfos": feedInfos,
      };
}
