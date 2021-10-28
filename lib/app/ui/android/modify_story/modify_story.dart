import 'package:ae_stagram_app/app/controller/new_story/new_story_controller.dart';
import 'package:ae_stagram_app/app/data/model/home/feed_info.dart';
import 'package:ae_stagram_app/app/ui/android/modify_story/components/cancel_dialog.dart';
import 'package:ae_stagram_app/app/ui/android/modify_story/components/upload_image_picker.dart';
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:ae_stagram_app/app/ui/theme/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModifyStory extends StatelessWidget {
  ModifyStory({Key? key}) : super(key: key);
  final FeedInfo feed = Get.arguments as FeedInfo;

  @override
  Widget build(BuildContext context) {
    NewStoryController.to.toggleShared(feed.images);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: TextButton(
          child: Text(
            '취소',
            style: TextStyle(
              color: mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          onPressed: () {
            cancelDialog(context).then((value) => Get.back());
          },
        ),
        title: Text(
          'Modify Story',
          style: appBarTitleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              UploadImagePicker(),
            ],
          ),
        ),
      ),
    );
  }
}
