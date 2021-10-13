import 'package:ae_stagram_app/app/controller/controllers.dart';
import 'package:ae_stagram_app/app/controller/home/home_controller.dart';
import 'package:ae_stagram_app/app/ui/android/home/components/story_card.dart';
import 'package:ae_stagram_app/app/ui/android/home/components/story_card_empty.dart';
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorySwipe extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.size.height * 0.8,
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: mainColor,
        child: Obx(
          () => controller.storyCardResult.value.feedInfos.length != 0
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: controller.scrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.storyCardResult.value.feedInfos.length,
                  itemBuilder: (context, index) {
                    return StoryCard(
                      feed: controller.storyCardResult.value.feedInfos[index],
                    );
                  })
              : StoryCardEmpty(),
        ));
  }
}
