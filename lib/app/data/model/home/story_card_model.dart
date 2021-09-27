import 'dart:convert';

StoryCardModel storyCardModelFromJson(String str) =>
    StoryCardModel.fromJson(json.decode(str));

String storyCardModelToJson(StoryCardModel data) => json.encode(data.toJson());

class StoryCardModel {
  StoryCardModel({
    required this.id,
    this.displayName,
    this.content,
    this.images,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String? displayName;
  String? content;
  List? images;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory StoryCardModel.fromJson(Map<String, dynamic> json) => StoryCardModel(
        id: json['id'],
        displayName: json['display_name'],
        content: json['content'],
        images: json['images'],
        // createdAt: json["createdAt"] != Null
        //     ? DateTime.parse(json["createdAt"])
        //     : DateTime.now(),
        // updatedAt: json["updatedAt"] != Null
        //     ? DateTime.parse(json["updatedAt"])
        //     : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
        "content": content,
        "images": images,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
