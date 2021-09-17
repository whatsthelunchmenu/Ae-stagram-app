import 'package:ae_stagram_app/app/controller/home/home_controller.dart';
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:ae_stagram_app/app/ui/theme/app_texts.dart';
import 'package:flutter/material.dart';

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
          HomeController.to.createStory(
            "반갑습니다",
            [
              {
                "id": null,
                "path":
                    "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y2hhbmdlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
              },
              {
                "id": null,
                "path":
                    "https://images.unsplash.com/photo-1612151855475-877969f4a6cc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGQlMjBpbWFnZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
              }
            ],
          );
          // Get.toNamed(Routes.NEWPAGE);
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
          // AuthController.to.login();
          HomeController.to.getStory();
          // Get.toNamed(Routes.MYPAGE);
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
