import './components.dart'
    show AnimationIconButton, deleteDialog, CardBottomTexts;
import 'package:ae_stagram_app/app/controller/controllers.dart'
    show AuthController, HomeController;
import 'package:ae_stagram_app/app/data/model/home/feed_info.dart';
import 'package:ae_stagram_app/app/route/app_pages.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryCard extends StatelessWidget {
  StoryCard({required this.feed});
  final FeedInfo feed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 5,
        right: 5,
        bottom: 5,
      ),
      color: Colors.white,
      width: Get.size.width * 0.85,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Top(feed: feed),
            Mid(images: feed.images),
            Bottom(feed: feed),
          ],
        ),
      ),
    );
  }
}

class Top extends StatelessWidget {
  const Top({
    Key? key,
    required this.feed,
  }) : super(key: key);

  final FeedInfo feed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Column(
        children: [
          Row(
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
                    feed.displayName,
                  ),
                ],
              ),
              // TODO : UID 비교로 변경해야 함
              AuthController.to.user?.displayName == feed.displayName
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: PopupMenuButton(
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              child: Text('수정'),
                              onTap: () async {
                                Get.toNamed(Routes.MODIFYPAGE, arguments: feed);
                              },
                            ),
                            PopupMenuItem(
                              child: Text('삭제'),
                              onTap: () async {
                                await deleteDialog(context, feed.id)
                                    .then((value) {
                                  Future.delayed(Duration(milliseconds: 500))
                                      .then((value) async {
                                    await HomeController.to.refresh();
                                  });
                                });
                              },
                            ),
                          ];
                        },
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}

class Mid extends StatefulWidget {
  const Mid({
    Key? key,
    this.images,
  }) : super(key: key);

  final List<String>? images;

  @override
  State<Mid> createState() => _MidState();
}

class _MidState extends State<Mid> {
  int currentIndex = 0;
  onChnagedIndex(index, reason) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            itemCount: widget.images?.length ?? 0,
            itemBuilder: (context, index, realIndex) {
              return Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Image.network(
                  widget.images?[index] ?? "",
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
                '${currentIndex + 1}/${widget.images?.length}',
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
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({
    Key? key,
    required this.feed,
  }) : super(key: key);

  final FeedInfo feed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              AnimationIconButton(
                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                selectedIcon: Icon(
                  CupertinoIcons.heart_fill,
                  size: 30,
                  color: Colors.redAccent,
                ),
                unSelectedIcon: Icon(
                  CupertinoIcons.heart,
                  size: 30,
                ),
                onTap: () {},
              ),
              Text(
                " 1000",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          CardBottomTexts(feed: feed),
        ],
      ),
    );
  }
}
