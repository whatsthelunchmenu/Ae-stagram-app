import 'package:ae_stagram_app/app/controller/controllers.dart'
    show NewStoryController;
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:ae_stagram_app/app/ui/theme/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadImagePicker extends GetWidget<NewStoryController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Photo', style: clearButtonTextStyle),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 120,
          child: Obx(
            () => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (controller.pickedImages.length > index) {
                        return Container(
                          width: Get.size.width * 0.35,
                          height: Get.size.width * 0.35,
                          child: Stack(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                height: Get.size.width * 0.35,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                      controller.pickedImages[index],
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                left: 0.0,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: InkWell(
                                    child: CircleAvatar(
                                      child: Center(
                                        child: Icon(Icons.close, size: 15),
                                      ),
                                      radius: 13,
                                      backgroundColor: lightMaincolor,
                                    ),
                                    onTap: () {
                                      controller.pickedImages.removeAt(index);
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      return Container();
                    },
                    itemCount: controller.pickedImages.length,
                  ),
                  const SizedBox(width: 10),
                  controller.pickedImages.length < 5
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: InkWell(
                            child: CircleAvatar(
                              radius: 25,
                              child: Icon(
                                Icons.add,
                                size: 25,
                              ),
                            ),
                            onTap: controller.pickMultipleImages,
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
