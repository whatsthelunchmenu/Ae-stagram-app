import 'package:ae_stagram_app/app/controller/controllers.dart'
    show NewStoryController;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future cancelDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Text(
          '스토리 수정 취소',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        content: Text('수정을 취소할까요?'),
        actions: <Widget>[
          TextButton(
              onPressed: () async {
                await NewStoryController.to.clear();
                Get.back(result: true);
              },
              child: Text(
                '예',
                style: TextStyle(
                  color: Colors.red,
                ),
              )),
          TextButton(
              onPressed: () {
                Get.back(result: false);
              },
              child: Text('아니요')),
        ],
      );
    },
  );
}
