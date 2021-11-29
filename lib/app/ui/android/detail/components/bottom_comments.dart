import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class BottomComments extends StatelessWidget {
  const BottomComments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.size.height,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: ListTile(
              // TODO : 댓글 사용자 아이디 추가
              title: Text(
                '사용자 아이디 $index',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: CircleAvatar(
                radius: 15,
                // TODO : 댓글 사용자 프로필 사진 추가
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReadMoreText(
                    '하하하하 호호호 너무너무하하하하 호호호 너무너무 재미다아하하하하 호호호 너무너무 재미다아 재미다아하하하하 호호호 너무너무 재미다아',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: '접기...',
                    trimCollapsedText: '더 보기..',
                    moreStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
