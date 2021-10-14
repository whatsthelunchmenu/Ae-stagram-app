import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryCardEmpty extends StatelessWidget {
  const StoryCardEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
        right: 10,
        left: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: Get.size.height * 0.3,
              child: Image.asset(
                "assets/images/empty_feed.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            Text(
              '피드가 없어요... \n이야기를 들려주세요!',
              textAlign: TextAlign.center,
              style: GoogleFonts.nanumBrushScript(
                fontSize: 45,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
