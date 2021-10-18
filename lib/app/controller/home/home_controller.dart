import 'package:ae_stagram_app/app/controller/logger/logger_controller.dart';
import 'package:ae_stagram_app/app/data/model/home/story_card_model.dart';
import 'package:ae_stagram_app/app/data/repository/home/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  late ScrollController scrollController;
  late HomeRepository repository;
  Rx<StoryCardModel> storyCardResult = StoryCardModel(feedInfos: []).obs;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    repository = HomeRepository();
    getStory();
    addEvent();
  }

  @override
  void onClose() {
    super.onClose();
  }

  createStory(String content, List<String> images) {
    repository.createStory(content, images);
  }

  getStory() async {
    StoryCardModel? result =
        await repository.getStory(storyCardResult.value.hasNextToken);

    if (result != null && result.feedInfos.length > 0) {
      storyCardResult.update((storyCard) {
        storyCard!.hasNextToken = result.hasNextToken;
        storyCard.feedInfos.addAll(result.feedInfos);
      });
      storyCardResult.refresh();
    }
  }

  void addEvent() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          storyCardResult.value.hasNextToken.isNotEmpty) {
        getStory();
      }
    });
  }

  Future<void> refresh() async {
    StoryCardModel? result = await repository.getStory("");
    storyCardResult.update((storyCard) {
      storyCard = result;
    });
    storyCardResult.refresh();
    LoggerController.to.logger.i("[refresh]List Refreshed");
  }
}
