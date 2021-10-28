import 'package:ae_stagram_app/app/data/model/home/feed_info.dart';
import 'package:ae_stagram_app/app/ui/theme/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModifyStory extends StatelessWidget {
  ModifyStory({Key? key}) : super(key: key);
  final FeedInfo feed = Get.arguments as FeedInfo;

  @override
  Widget build(BuildContext context) {
    print(feed);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Modify Story',
          style: appBarTitleTextStyle,
        ),
      ),
    );
  }
}
