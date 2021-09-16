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
  });

  int id;
  String? displayName;
  String? content;
  List<StoryImages>? images;

  factory StoryCardModel.fromJson(Map<String, dynamic> json) => StoryCardModel(
        id: json['id'],
        displayName: json['display_name'],
        content: json['content'],
        images: json['images']
            .map<StoryImages>((e) => StoryImages.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
        "content": content,
        "images": images,
      };
}

class StoryImages {
  StoryImages({
    required this.id,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String? imagePath;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory StoryImages.fromJson(Map<String, dynamic> json) => StoryImages(
        id: json["id"],
        imagePath: json["imagePath"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imagePath": imagePath,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
