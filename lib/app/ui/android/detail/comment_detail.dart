import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class CommentDetail extends StatefulWidget {
  @override
  State<CommentDetail> createState() => _CommentDetailState();
}

class _CommentDetailState extends State<CommentDetail> {
  int currentIndex = 0;
  final dynamic feed = Get.arguments;

  onChnagedIndex(index, reason) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          '${feed.displayName} 의 스토리',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  feed.displayName,
                ),
              ],
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
                      onPageChanged: onChnagedIndex,
                      reverse: false,
                      enlargeCenterPage: false,
                      enableInfiniteScroll: false,
                    ),
                    itemCount: feed.images?.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blue,
                        child: Image.network(
                          feed.images?[index] ?? "",
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
                        '${currentIndex + 1}/${feed.images?.length}',
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
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${feed.displayName}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Text('${feed.content}'),
                  Text('ddddd\n\n\n\n\n\n\n\n\nasdasdas'),
                ],
              ),
            ),
            Container(
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
            )
          ],
        ),
      ),
    );
  }
}
