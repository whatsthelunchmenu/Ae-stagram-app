import 'dart:io';
import 'dart:ui';

import 'package:ae_stagram_app/app/ui/android/new_story/upload_image_picker.dart';
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:ae_stagram_app/app/ui/theme/app_texts.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class NewStory extends StatefulWidget {
  @override
  State<NewStory> createState() => _NewStoryState();
}

class _NewStoryState extends State<NewStory> {
  late ImagePicker _picker;
  late TextEditingController _textController;
  List<File> _pickedImages = <File>[];

  @override
  void initState() {
    _picker = ImagePicker();
    _textController = TextEditingController();
    super.initState();
  }

  Future _pickPhotoImage() async {
    _pickedImages.clear();
    await _picker.pickMultiImage().then((value) {
      if (_pickedImages.length > 5) {
        _pickedImages = value!.map((e) => File(e.path)).toList().sublist(0, 5);
      } else {
        _pickedImages = value!.map((e) => File(e.path)).toList();
      }
    });
    setState(() {});
  }

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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            UploadImagePicker(),
            SizedBox(height: 20),
            Text(
              "Content",
              style: GoogleFonts.indieFlower(
                fontSize: 32,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: TextField(
                controller: _textController,
                maxLength: 200,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  counterText: "",
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: lightMaincolor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                  ),
                  child: Text(
                    "Clear",
                    style: GoogleFonts.indieFlower(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.size.height * 0.06),
            Container(
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
          ],
        ),
      ),
    );
  }
}
