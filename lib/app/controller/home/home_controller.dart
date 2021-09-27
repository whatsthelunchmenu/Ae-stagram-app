import 'package:ae_stagram_app/app/data/model/dummy_story.dart';
import 'package:ae_stagram_app/app/data/model/response_model.dart';
import 'package:ae_stagram_app/app/data/model/home/story_card_model.dart';
import 'package:ae_stagram_app/app/data/repository/home/home_repository.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  late CarouselController carouselController;
  late HomeRepository repository;
  RxList<StoryCardModel> storyList = <StoryCardModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    carouselController = CarouselController();
    repository = HomeRepository();
    getStory();
  }

  @override
  void onClose() {
    super.onClose();
  }

  dummyLoad() {
    final result = ResponseModel.fromJson(DummyStory().dummy);
    final List<StoryCardModel> test = result.body
        .map<StoryCardModel>((e) => StoryCardModel.fromJson(e))
        .toList();
    storyList.addAll(test);
  }

  createStory(String content, List<String> images) {
    repository.createStory(content, images);
  }

  getStory() async {
    final result = await repository.getStory();
    final List<StoryCardModel> response = result.body
        .map<StoryCardModel>((e) => StoryCardModel.fromJson(e))
        .toList();
    storyList.addAll(response);
  }

  void addEvent() {}
}
