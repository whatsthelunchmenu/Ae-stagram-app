import 'package:ae_stagram_app/app/controller/home/home_controller.dart';
import 'package:ae_stagram_app/app/route/app_pages.dart';
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:ae_stagram_app/app/ui/theme/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(right: 40, left: 40, bottom: 20),
        color: mainColor,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  NewStoryButton(),
                  BabyIcon(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  MyPageButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewStoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: Colors.blueAccent.withOpacity(0.2),
            ),
            color: Colors.blue.withOpacity(0.4),
          ),
          child: Center(
            child: Text(
              'New Story',
              style: actionButtonTextStyle,
            ),
          ),
        ),
        onTap: () {
          Get.toNamed(Routes.NEWPAGE);
        },
      ),
    );
  }
}

class MyPageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: Colors.blueAccent.withOpacity(0.2),
            ),
            color: Colors.blue.withOpacity(0.4),
          ),
          child: Center(
            child: Text(
              'My',
              style: actionButtonTextStyle,
            ),
          ),
        ),
        onTap: () {
          HomeController.to.getStory();
        },
      ),
    );
  }
}

class BabyIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: const EdgeInsets.all(4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: Image.asset(
                  "assets/images/baby.png",
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Aestagram',
                style: mainIconTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
