import 'package:ae_stagram_app/app/controller/controllers.dart'
    show NewStoryController;
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:ae_stagram_app/app/ui/theme/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentWriteBoard extends GetWidget<NewStoryController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Content", style: clearButtonTextStyle),
        SizedBox(height: 10),
        Container(
          height: 120,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: TextField(
            focusNode: controller.textFocusNode,
            autofocus: false,
            controller: controller.textController,
            maxLength: 200,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            style: TextStyle(
              fontSize: 16,
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
              onPressed: () {
                controller.textController.clear();
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
              ),
              child: Text(
                "Clear",
                style: clearButtonTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
