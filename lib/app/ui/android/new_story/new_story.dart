import 'dart:io';
import 'dart:ui';

import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:ae_stagram_app/app/ui/theme/app_texts.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
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
            ElevatedButton(
              onPressed: () async {
                _pickedImages.clear();
                await _picker.pickMultiImage().then((value) {
                  if (_pickedImages.length > 5) {
                    _pickedImages =
                        value!.map((e) => File(e.path)).toList().sublist(0, 5);
                  } else {
                    _pickedImages = value!.map((e) => File(e.path)).toList();
                  }
                });
                setState(() {});
              },
              child: Text(
                "Select Photo",
                style: appBarTitleTextStyle,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return VerticalDivider(
                    width: 10,
                  );
                },
                itemBuilder: (context, index) {
                  if (_pickedImages.length > index) {
                    return Container(
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:
                            Image.file(_pickedImages[index], fit: BoxFit.cover),
                      ),
                    );
                  }
                  return Container(
                      width: 150,
                      decoration: DottedDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                        shape: Shape.box,
                        linePosition: LinePosition.top,
                        strokeWidth: 3,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 40,
                        ),
                        onPressed: () async {
                          await _picker
                              .pickImage(source: ImageSource.gallery)
                              .then(
                            (value) {
                              setState(() {
                                _pickedImages.add(File(value!.path));
                              });
                            },
                          );
                        },
                      ));
                },
                itemCount: 5,
              ),
            ),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.11),
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
