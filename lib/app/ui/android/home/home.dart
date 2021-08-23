import 'package:ae_stagram_app/app/controller/controllers.dart';
import 'package:ae_stagram_app/app/ui/android/home/components/drawer.dart';
import 'package:ae_stagram_app/app/ui/android/home/components/story_card.dart';
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Aestagram',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          elevation: 0.0,
        ),
        drawer: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: HomeDrawer(),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(right: 30, left: 30),
                color: mainColor,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    StoryCard(),
                    StoryCard(),
                    StoryCard(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
