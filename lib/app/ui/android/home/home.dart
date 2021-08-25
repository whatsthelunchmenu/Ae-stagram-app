import 'package:ae_stagram_app/app/controller/controllers.dart';
import 'package:ae_stagram_app/app/ui/android/home/components/action_buttons.dart';
import 'package:ae_stagram_app/app/ui/android/home/components/drawer.dart';
import 'package:ae_stagram_app/app/ui/android/home/components/story_swipe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Aestagram',
            style: GoogleFonts.indieFlower(
              fontSize: 24,
              fontWeight: FontWeight.bold,
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
            StorySwipe(),
            ActionButtons(),
          ],
        ),
      ),
    );
  }
}
