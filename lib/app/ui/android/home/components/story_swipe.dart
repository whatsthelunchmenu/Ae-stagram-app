import 'package:ae_stagram_app/app/controller/home/home_controller.dart';
import 'package:ae_stagram_app/app/ui/android/home/components/story_card.dart';
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorySwipe extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.only(right: 30, left: 30),
          color: mainColor,
          child: ListView.builder(
              controller: controller.scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: controller.storyCardResult.value.feedInfos.length,
              itemBuilder: (context, index) {
                return StoryCard(
                  feed: controller.storyCardResult.value.feedInfos[index],
                );
              }),
        ),
      ),
    );
  }
}
