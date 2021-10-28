import 'package:ae_stagram_app/app/controller/controllers.dart'
    show NewStoryController;
import 'components.dart'
    show ContentWriteBoard, CreateButton, UploadImagePicker;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewStoryBody extends GetWidget<NewStoryController> {
  const NewStoryBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            UploadImagePicker(),
            SizedBox(height: 20),
            ContentWriteBoard(),
            SizedBox(height: Get.size.height * 0.06),
            CreateButton(),
          ],
        ),
      ),
    );
  }
}
