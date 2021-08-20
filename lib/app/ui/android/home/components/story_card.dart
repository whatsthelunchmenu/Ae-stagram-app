import 'package:ae_stagram_app/app/controller/home/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class StoryCard extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: Get.size.height * 0.5,
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
        ],
      ),
    );
  }
}
