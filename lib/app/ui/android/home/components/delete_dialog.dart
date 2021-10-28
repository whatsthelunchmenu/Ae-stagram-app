import 'package:ae_stagram_app/app/controller/controllers.dart'
    show HomeController;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future deleteDialog(BuildContext context, int feedId) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Text(
          '스토리 삭제',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        content: Text('스토리를 삭제할까요?'),
        actions: <Widget>[
          TextButton(
              onPressed: () async {
                await HomeController.to.deleteStory(feedId);
                Get.back();
              },
              child: Text(
                '삭제',
                style: TextStyle(
                  color: Colors.red,
                ),
              )),
          TextButton(onPressed: () {}, child: Text('취소')),
        ],
      );
    },
  );
}
