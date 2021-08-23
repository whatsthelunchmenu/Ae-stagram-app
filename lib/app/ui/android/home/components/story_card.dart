import 'package:ae_stagram_app/app/controller/home/home_controller.dart';
import 'package:ae_stagram_app/app/ui/android/home/detail/comment_detail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class StoryCard extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      // height: Get.size.height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: Get.size.height * 0.06,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: CircleAvatar(
                        radius: 15,
                      ),
                    ),
                    Text(
                      'Junewoo Park',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    child: Icon(Icons.more_vert),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            child: Divider(
              thickness: 0.5,
            ),
          ),
          Container(
            child: Stack(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 230.0,
                    onPageChanged: controller.onPageChanged,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue,
                      child: Image.network(
                        "https://carpeoplemarketing.com/wp-content/uploads/2018/09/WOW-Customer-1080x675.png",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 5,
                  right: MediaQuery.of(context).size.width * 0.02,
                  child: Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${controller.currentIndex.value + 1}/3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CardBottomTexts(),
        ],
      ),
    );
  }
}

class CardBottomTexts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '좋아요 320개',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
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
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: InkWell(
              onTap: () {
                Get.to(CommentDetail());
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
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
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
