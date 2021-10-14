import 'package:ae_stagram_app/app/controller/root_controller.dart';
import 'package:ae_stagram_app/app/ui/android/home/home.dart';
import 'package:ae_stagram_app/app/ui/android/mypage/mypage.dart';
import 'package:ae_stagram_app/app/ui/android/new_story/new_story.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavigationPage extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // body: switchBody(RouteName.values[controller.currentIndex.value]),
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.shifting,
        //   currentIndex: controller.currentIndex.value,
        //   showSelectedLabels: true,
        //   selectedItemColor: Colors.black,
        //   unselectedItemColor: Colors.grey,
        //   onTap: controller.chnagePageIndex,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       activeIcon: Icon(Icons.home_filled),
        //       label: "Home",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person),
        //       activeIcon: Icon(Icons.people_alt),
        //       label: "My Page",
        //     ),
        //   ],
        // ),
        body: PersistentTabView(
          context,
          controller: controller.tabController,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style15, // Choose the nav bar style with this property.
        ),
      ),
    );
  }

  Widget switchBody(RouteName value) {
    switch (value) {
      case RouteName.Home:
        return Home();
      case RouteName.MyPage:
        return MyPage();
    }
  }

  _buildScreens() {
    return [
      Home(),
      NewStory(),
      MyPage(),
    ];
  }

  _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
        title: ("Add Story"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("My"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
