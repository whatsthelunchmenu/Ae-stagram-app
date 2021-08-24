import 'package:ae_stagram_app/app/controller/controllers.dart';
import 'package:ae_stagram_app/app/route/app_pages.dart';
import 'package:ae_stagram_app/app/ui/android/home/components/drawer.dart';
import 'package:ae_stagram_app/app/ui/android/home/components/story_card.dart';
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Aestagram',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          elevation: 0.0,
        ),
        drawer: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: HomeDrawer(),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(right: 30, left: 30),
                color: mainColor,
                child: CarouselSlider.builder(
                  carouselController: controller.carouselController,
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: Get.size.height * 0.55,
                    reverse: false,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return StoryCard();
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(right: 40, left: 40, bottom: 20),
                color: mainColor,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.blueAccent.withOpacity(0.2),
                                ),
                                color: Colors.blue.withOpacity(0.4),
                              ),
                              child: Center(
                                child: Text(
                                  'Refresh',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.blueAccent.withOpacity(0.2),
                                ),
                                color: Colors.blue.withOpacity(0.4),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.blueAccent.withOpacity(0.2),
                                  ),
                                  color: Colors.blue.withOpacity(0.4),
                                ),
                                child: Center(
                                  child: Text(
                                    'My',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Get.toNamed(Routes.MYPAGE);
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
