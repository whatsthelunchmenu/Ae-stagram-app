import 'package:ae_stagram_app/app/controller/controllers.dart';
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
          leading: Drawer(
            elevation: 0.0,
            child: Container(
              color: mainColor,
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
            ),
          ),
          title: Text(
            'Aestagram',
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
            ),
          ),
          elevation: 0.0,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: mainColor,
          child: ListView(
            children: [
              StoryCard(),
              StoryCard(),
              StoryCard(),
            ],
          ),
        ),
      ),
    );
  }
}
