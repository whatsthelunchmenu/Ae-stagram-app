import 'dart:ui';

import 'package:ae_stagram_app/app/controller/home/home_controller.dart';
import 'package:ae_stagram_app/app/controller/new_story/new_story_controller.dart';
import 'package:ae_stagram_app/app/controller/root_controller.dart';
import 'package:ae_stagram_app/app/ui/android/new_story/components/content_write_board.dart';
import 'package:ae_stagram_app/app/ui/android/new_story/components/upload_image_picker.dart';
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewStory extends GetWidget<NewStoryController> {
  final NewStoryController controller = Get.put(NewStoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
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
              InkWell(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: mainColor,
                  ),
                  child: Center(
                    child: Text(
                      "Create new story",
                      style: GoogleFonts.indieFlower(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                onTap: () async {
                  EasyLoading.showProgress(0.5, status: "Create...");
                  await controller
                      .createStory(controller.textController.value.text,
                          controller.pickedImages)
                      .then((value) {
                    EasyLoading.dismiss();
                    RootController.to.tabController.jumpToTab(0);
                    HomeController.to.refresh();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
