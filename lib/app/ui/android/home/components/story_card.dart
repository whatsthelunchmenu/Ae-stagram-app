import 'package:ae_stagram_app/app/data/model/story_card_model.dart';
import 'package:ae_stagram_app/app/ui/android/home/components/animated_button_icon.dart';
import 'package:ae_stagram_app/app/ui/android/home/components/story_card_bottom_texts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryCard extends StatefulWidget {
  StoryCard({required this.story});
  final StoryCardModel story;

  @override
  _StoryCardState createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  int currentIndex = 0;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  onChnagedIndex(index, reason) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      width: Get.size.width * 0.85,
      child: SingleChildScrollView(
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
                        widget.story.id,
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
                      onPageChanged: onChnagedIndex,
                      reverse: false,
                      enlargeCenterPage: false,
                      enableInfiniteScroll: false,
                    ),
                    itemCount: widget.story.images.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blue,
                        child: Image.network(
                          widget.story.images[index],
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
                        '${currentIndex + 1}/${widget.story.images.length}',
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
                  " ${widget.story.likeCount}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            CardBottomTexts(
              story: widget.story,
            ),
          ],
        ),
      ),
    );
  }
}
