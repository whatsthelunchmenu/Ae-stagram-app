class StoryCardModel {
  String uid;
  String id;
  String content;
  int likeCount;
  int commentCount;
  List<String> images;

  StoryCardModel({
    required this.uid,
    required this.id,
    this.content = "",
    this.likeCount = 0,
    this.commentCount = 0,
    this.images = const <String>[],
  });

  factory StoryCardModel.fromJson(Map<dynamic, dynamic> map) {
    return StoryCardModel(
      uid: map['uid'],
      id: map['id'],
      content: map['content'],
      likeCount: map['likeCount'],
      commentCount: map['commentCount'],
      images: map['images'],
    );
  }
}
