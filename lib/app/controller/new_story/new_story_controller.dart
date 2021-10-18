import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewStoryController extends GetxController {
  static NewStoryController get to => Get.find();
  late ImagePicker _picker;
  late TextEditingController textEditingController;
  RxInt _fixedPage = 5.obs;
  RxList<File> _pickedImages = <File>[].obs;

  @override
  void onInit() {
    _picker = ImagePicker();
    textEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  List<File> get pickedImages => _pickedImages;
  int get fixedPage => _fixedPage.value;

  Future pickMultipleImages() async {
    _pickedImages.clear();
    await _picker.pickMultiImage().then(
      (value) {
        if (_pickedImages.length > 5) {
          _pickedImages(value!.map((e) => File(e.path)).toList().sublist(0, 5));
        } else {
          _pickedImages(value!.map((e) => File(e.path)).toList());
        }
      },
    );
  }

  Future pickSingleImage() async {
    await _picker.pickImage(source: ImageSource.gallery).then((value) {
      _pickedImages.add(File(value!.path));
    });
  }
}
