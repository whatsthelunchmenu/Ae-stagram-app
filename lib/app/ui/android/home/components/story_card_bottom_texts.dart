import 'package:ae_stagram_app/app/ui/android/home/detail/comment_detail.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:get/get.dart';

class CardBottomTexts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReadMoreText(
            'Junewoo Park 내용내용내용내용내용내용내용내용내내용내용용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내내용내용용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내내용내용용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내내용내용용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내내용내용용내용내용내',
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.start,
            colorClickableText: Colors.black,
            trimCollapsedText: '펼치기',
            trimExpandedText: '접기',
            trimLines: 2,
            trimMode: TrimMode.Length,
            trimLength: 50,
            moreStyle: TextStyle(
              color: Colors.grey,
            ),
            lessStyle: TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: InkWell(
              onTap: () {
                Get.to(() => CommentDetail());
              },
              child: Text(
                '댓글 350개 모두 보기',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 12,
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {},
                  child: Text(
                    '댓글 달기...',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
