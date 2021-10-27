import 'dart:io';
import 'package:ae_stagram_app/app/data/repository/new_story/new_story_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewStoryController extends GetxController {
  static NewStoryController get to => Get.find();
  late ImagePicker _picker;
  late TextEditingController _textEditingController;
  late NewStoryRepository repository;
  RxList<File> _pickedImages = <File>[].obs;

  @override
  void onInit() {
    _picker = ImagePicker();
    _textEditingController = TextEditingController();
    repository = NewStoryRepository();
    super.onInit();
  }

  @override
  void onClose() {
    _textEditingController.dispose();
    _pickedImages.clear();
    super.onClose();
  }

  List<File> get pickedImages => _pickedImages;
  TextEditingController get textController => _textEditingController;

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

  Future createStory(String content, List<File> images) async {
    await repository.createStory(content, images).then((value) {
      pickedImages.clear();
      _textEditingController.clear();
    });
  }
}
