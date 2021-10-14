import 'package:ae_stagram_app/app/controller/root_controller.dart';
import 'package:ae_stagram_app/app/ui/android/home/home.dart';
import 'package:ae_stagram_app/app/ui/android/mypage/mypage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NavigationPage extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          switch (RouteName.values[controller.currentIndex.value]) {
            case RouteName.Home:
              return Home();
            case RouteName.MyPage:
              return MyPage();
          }
        }),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              currentIndex: controller.currentIndex.value,
              showSelectedLabels: true,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              onTap: controller.chnagePageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.home_filled),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  activeIcon: Icon(Icons.people_alt),
                  label: "My Page",
                ),
              ],
            )));
  }
}
