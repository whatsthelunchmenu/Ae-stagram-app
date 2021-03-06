import 'package:ae_stagram_app/app/controller/controllers.dart'
    show NewStoryController;

import 'package:ae_stagram_app/app/data/model/models.dart' show FeedInfo;
import 'components.dart' show ModifyBody, cancelDialog;

import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:ae_stagram_app/app/ui/theme/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModifyStory extends StatelessWidget {
  ModifyStory({Key? key}) : super(key: key);
  final FeedInfo feed = Get.arguments as FeedInfo;

  @override
  Widget build(BuildContext context) {
    NewStoryController.to.toggleShared(feed.images, feed.content);
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
            cancelDialog(context).then((value) {
              if (value) Get.back();
            });
          },
        ),
        title: Text(
          'Modify Story',
          style: appBarTitleTextStyle,
        ),
      ),
      body: ModifyBody(feedId: feed.id),
    );
  }
}
