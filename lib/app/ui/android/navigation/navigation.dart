import 'package:ae_stagram_app/app/controller/root_controller.dart';
import 'package:ae_stagram_app/app/ui/android/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NavigationPage extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
      // body: Obx(() {
      //   switch (RouteName.values[controller.currentIndex.value]) {
      //     case RouteName.Home:
      //       return Home();
      //     case RouteName.MyPage:
      //       return MyPage();
      //   }
      // }),
      // bottomNavigationBar: Obx(
      //   () => BottomNavigationBar(
      //     backgroundColor: mainColor,
      //     type: BottomNavigationBarType.fixed,
      //     currentIndex: controller.currentIndex.value,
      //     showSelectedLabels: true,
      //     selectedItemColor: Colors.black,
      //     iconSize: 28,
      //     onTap: controller.chnagePageIndex,
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home_outlined),
      //         activeIcon: Icon(Icons.home_filled),
      //         label: "Home",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person_outline),
      //         activeIcon: Icon(Icons.person),
      //         label: "My",
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
