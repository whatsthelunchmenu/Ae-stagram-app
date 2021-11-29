import 'package:ae_stagram_app/app/data/model/models.dart' show FeedInfo;
import 'components.dart' show Top, Mid, Bottom, BottomComments;
import 'package:ae_stagram_app/app/ui/theme/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentDetail extends StatelessWidget {
  final dynamic feed = Get.arguments as FeedInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          '${feed.displayName} 의 스토리',
          style: commentDetailTitleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Top(feed: feed),
            Mid(feed: feed),
            Bottom(feed: feed),
            BottomComments()
          ],
        ),
      ),
    );
  }
}
