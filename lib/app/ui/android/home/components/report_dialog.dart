import 'package:ae_stagram_app/app/controller/controllers.dart'
    show HomeController;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future reportDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Text(
          '스토리 신고',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        content: Text('스토리를 신고할까요?'),
        actions: <Widget>[
          TextButton(
              onPressed: () async {
                Get.back();
                Get.defaultDialog(middleText: "신고되었습니다", title: "Report");
              },
              child: Text(
                '신고',
                style: TextStyle(
                  color: Colors.red,
                ),
              )),
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('취소')),
        ],
      );
    },
  );
}
