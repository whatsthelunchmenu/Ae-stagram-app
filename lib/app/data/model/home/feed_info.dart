class FeedInfo {
  FeedInfo({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.displayName = "",
    this.content = "",
    this.images,
  });

  int id;
  String displayName;
  String content;
  List<String>? images;
  DateTime createdAt;
  DateTime updatedAt;

  factory FeedInfo.fromJson(Map<String, dynamic> json) => FeedInfo(
        id: json["id"],
        displayName: json["display_name"],
        content: json["content"],
        images: List<String>.from(json["images"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "display_name": displayName,
        "content": content,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
