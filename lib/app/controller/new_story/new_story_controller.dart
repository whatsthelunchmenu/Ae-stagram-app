import 'dart:io';
import 'package:ae_stagram_app/app/data/repository/new_story/new_story_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show join;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class NewStoryController extends GetxController {
  static NewStoryController get to => Get.find();
  late ImagePicker _picker;
  late TextEditingController _textEditingController;
  late FocusNode _textFocusNode;
  late NewStoryRepository repository;
  RxList<File> _pickedImages = <File>[].obs;

  @override
  void onInit() {
    _picker = ImagePicker();
    _textEditingController = TextEditingController();
    _textFocusNode = FocusNode();
    repository = NewStoryRepository();
    super.onInit();
  }

  @override
  void onClose() {
    _textEditingController.dispose();
    _textFocusNode.dispose();
    _pickedImages.clear();
    super.onClose();
  }

  List<File> get pickedImages => _pickedImages;
  TextEditingController get textController => _textEditingController;
  FocusNode get textFocusNode => _textFocusNode;

  Future pickMultipleImages() async {
    // _pickedImages.clear();
    await _picker.pickMultiImage().then(
      (value) {
        if (value!.length > 5) {
          _pickedImages
              .addAll(value.map((e) => File(e.path)).toList().sublist(0, 5));
        } else {
          _pickedImages.addAll(value.map((e) => File(e.path)).toList());
        }

        if (_pickedImages.length > 5) {
          _pickedImages(_pickedImages.sublist(0, 5));
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
      _pickedImages.clear();
      _textEditingController.clear();
    });
  }

  clear() {
    _pickedImages.clear();
    _textEditingController.clear();
  }

  toggleShared(List<String>? images) async {
    final List<File> syncImages = [];
    int count = 0;
    if (images != null) {
      for (var i in images) {
        final response = await http.get(Uri.parse(i));
        final documentDirectory = await getApplicationDocumentsDirectory();
        final file =
            File(join(documentDirectory.path, 'temp_image_$count.png'));
        file.writeAsBytes(response.bodyBytes);
        count++;
        syncImages.add(file);
      }
      _pickedImages(syncImages);
    }
  }
}
