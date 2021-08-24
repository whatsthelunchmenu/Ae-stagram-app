import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  late CarouselController carouselController;

  @override
  void onInit() {
    super.onInit();
    carouselController = CarouselController();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
