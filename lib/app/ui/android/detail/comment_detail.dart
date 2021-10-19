import 'package:ae_stagram_app/app/data/model/home/feed_info.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Column(
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
          Text('${feed.content}'),
        ],
      ),
    );
  }
}
