import 'dart:convert';

import 'package:ae_stagram_app/app/data/model/dummy_story.dart';
import 'package:ae_stagram_app/app/data/model/story_card_model.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  late CarouselController carouselController;
  RxList<StoryCardModel> storyList = <StoryCardModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    carouselController = CarouselController();
    dummyLoad();
  }

  @override
  void onClose() {
    super.onClose();
  }

  dummyLoad() {
    final result = DummyStory().dummy.map((e) => StoryCardModel.fromJson(e));
    storyList.addAll(result);
  }
}
