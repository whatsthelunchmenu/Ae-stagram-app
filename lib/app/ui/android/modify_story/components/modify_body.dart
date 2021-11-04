import 'package:ae_stagram_app/app/controller/controllers.dart'
    show NewStoryController;

import 'package:ae_stagram_app/app/ui/android/utils/components.dart'
    show UploadImagePicker, ContentWriteBoard;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modify_button.dart';

class ModifyBody extends GetWidget<NewStoryController> {
  const ModifyBody({
    required this.feedId,
    Key? key,
  }) : super(key: key);

  final int feedId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            UploadImagePicker(),
            SizedBox(height: 10),
            ContentWriteBoard(),
            SizedBox(height: Get.size.height * 0.04),
            ModifyButton(feedId: feedId),
          ],
        ),
      ),
    );
  }
}
