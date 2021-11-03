import 'package:ae_stagram_app/app/controller/controllers.dart'
    show NewStoryController;
import 'package:ae_stagram_app/app/ui/android/modify_story/components/create_button.dart';
import 'package:ae_stagram_app/app/ui/android/utils/components.dart'
    show UploadImagePicker, ContentWriteBoard;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModifyBody extends GetWidget<NewStoryController> {
  const ModifyBody({
    Key? key,
  }) : super(key: key);

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
            ModifyButton(),
          ],
        ),
      ),
    );
  }
}
