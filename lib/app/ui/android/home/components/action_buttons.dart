import 'package:ae_stagram_app/app/controller/auth/auth_controller.dart';
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
                  RefreshButton(),
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
          // Get.toNamed(Routes.MYPAGE);
          AuthController.to.getTest();
        },
      ),
    );
  }
}

class RefreshButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
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
            'Refresh',
            style: actionButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
