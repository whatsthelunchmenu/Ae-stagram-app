import 'package:ae_stagram_app/app/controller/controllers.dart'
    show NewStoryController;
import 'components.dart' show NewStoryBody;
import 'package:ae_stagram_app/app/ui/theme/app_texts.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewStory extends StatelessWidget {
  final NewStoryController controller = Get.put(NewStoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'New Story',
          style: appBarTitleTextStyle,
        ),
      ),
      body: NewStoryBody(),
    );
  }
}
