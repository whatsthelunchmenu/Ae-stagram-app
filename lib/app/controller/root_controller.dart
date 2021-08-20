import 'package:get/get.dart';

enum RouteName {
  Home,
  MyPage,
}

class RootController extends GetxController {
  static RootController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void chnagePageIndex(int selectedIndex) {
    currentIndex(selectedIndex);
  }
}
