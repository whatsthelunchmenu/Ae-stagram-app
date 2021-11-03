import 'package:ae_stagram_app/app/controller/controllers.dart'
    show HomeController, NewStoryController, RootController;
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifyButton extends GetWidget<NewStoryController> {
  const ModifyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: mainColor,
        ),
        child: Center(
          child: Text(
            "Modify story",
            style: GoogleFonts.indieFlower(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () async {
        EasyLoading.showProgress(0.5, status: "Modify...");
        await controller
            .createStory(
                controller.textController.value.text, controller.pickedImages)
            .then((value) {
          EasyLoading.dismiss();
          RootController.to.tabController.jumpToTab(0);
          HomeController.to.refresh();
        });
      },
    );
  }
}
