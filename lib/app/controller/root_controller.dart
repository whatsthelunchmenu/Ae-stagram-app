import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

enum RouteName {
  Home,
  MyPage,
}

class RootController extends GetxController {
  static RootController get to => Get.find();
  late PersistentTabController tabController;
  GlobalKey<NavigatorState> navigaotorKey = GlobalKey<NavigatorState>();
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = PersistentTabController(initialIndex: currentIndex.value);
  }

  void chnagePageIndex(int selectedIndex) {
    currentIndex(selectedIndex);
  }

  Future<bool> onWillPop() async {
    return !await navigaotorKey.currentState!.maybePop();
  }
}
