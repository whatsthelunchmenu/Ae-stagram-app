import 'package:ae_stagram_app/app/data/model/models.dart' show FeedInfo;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Mid extends StatefulWidget {
  const Mid({
    Key? key,
    required this.feed,
  }) : super(key: key);

  final FeedInfo feed;

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
            itemCount: widget.feed.images?.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Image.network(
                  widget.feed.images?[index] ?? "",
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
                '${currentIndex + 1}/${widget.feed.images?.length}',
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
