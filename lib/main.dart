import 'package:ae_stagram_app/app/binding/init_binding.dart';
import 'package:ae_stagram_app/app/route/app_pages.dart';
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ae-Stagram',
      theme: ThemeData(
        primaryColor: mainColor,
      ),
      initialBinding: InitBinding(),
      getPages: AppPages.pages,
      initialRoute: Routes.INITIAL,
      builder: EasyLoading.init(),
    );
  }
}
