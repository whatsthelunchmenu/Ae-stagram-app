import 'dart:io';

import 'package:ae_stagram_app/app/ui/theme/app_texts.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImagePicker extends StatefulWidget {
  const UploadImagePicker({Key? key}) : super(key: key);

  @override
  _UploadImagePickerState createState() => _UploadImagePickerState();
}

class _UploadImagePickerState extends State<UploadImagePicker> {
  late ImagePicker _picker;
  List<File> _pickedImages = <File>[];

  @override
  void initState() {
    _picker = ImagePicker();
    super.initState();
  }

  Future _pickMultipleImages() async {
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

  Future _pickSingleImage() async {
    await _picker.pickImage(source: ImageSource.gallery).then(
      (value) {
        setState(() {
          _pickedImages.add(File(value!.path));
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _pickMultipleImages,
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
                    child: Image.file(_pickedImages[index], fit: BoxFit.cover),
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
                  onPressed: _pickSingleImage,
                ),
              );
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
