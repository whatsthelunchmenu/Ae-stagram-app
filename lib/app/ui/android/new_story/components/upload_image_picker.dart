import 'package:ae_stagram_app/app/controller/controllers.dart'
    show NewStoryController;
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:ae_stagram_app/app/ui/theme/app_texts.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadImagePicker extends GetWidget<NewStoryController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: controller.pickMultipleImages,
          child: Text(
            "Select Multi Photo",
            style: appBarTitleTextStyle,
          ),
          style: ElevatedButton.styleFrom(
            primary: mainColor,
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          height: 150,
          child: Obx(
            () => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return VerticalDivider(
                        width: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      if (controller.pickedImages.length > index) {
                        return Container(
                          width: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(controller.pickedImages[index],
                                fit: BoxFit.cover),
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
                          onPressed: controller.pickSingleImage,
                        ),
                      );
                    },
                    itemCount: controller.pickedImages.length,
                  ),
                  const SizedBox(width: 10),
                  controller.pickedImages.length < 5
                      ? SizedBox(
                          child: Container(
                            height: 150,
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
                              onPressed: controller.pickSingleImage,
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
