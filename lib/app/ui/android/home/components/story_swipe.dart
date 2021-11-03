import '../components.dart' show StoryCard, StoryCardEmpty;
import 'package:ae_stagram_app/app/controller/controllers.dart'
    show HomeController;
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorySwipe extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          color: mainColor,
          child: Obx(
            () => controller.storyCardResult.value.feedInfos.length != 0
                ? RefreshIndicator(
                    onRefresh: controller.refresh,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: controller.scrollController,
                        scrollDirection: Axis.vertical,
                        itemCount:
                            controller.storyCardResult.value.feedInfos.length,
                        itemBuilder: (context, index) {
                          return StoryCard(
                            feed: controller
                                .storyCardResult.value.feedInfos[index],
                          );
                        }),
                  )
                : StoryCardEmpty(),
          )),
    );
  }
}
