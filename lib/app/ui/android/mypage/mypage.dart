import 'package:ae_stagram_app/app/controller/auth/auth_controller.dart';
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:ae_stagram_app/app/ui/theme/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Page', style: appBarTitleTextStyle),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage:
                      NetworkImage("${AuthController.to.user?.photoURL}"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "${AuthController.to.user?.displayName}",
                  style: GoogleFonts.indieFlower(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(10),
                        height: Get.size.height * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: lightMaincolor),
                        child: Column(
                          children: [
                            Text(
                              'Stories',
                              style: myPageBoxTitleTextStyle,
                            ),
                            SizedBox(height: Get.size.height * 0.05),
                            Center(
                              child: Text(
                                '1,230',
                                style: myPageBoxContentTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(10),
                        height: Get.size.height * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: lightMaincolor,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Comments',
                              style: myPageBoxTitleTextStyle,
                            ),
                            SizedBox(height: Get.size.height * 0.05),
                            Center(
                              child: Text(
                                '1,230',
                                style: myPageBoxContentTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
