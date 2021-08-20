import 'package:ae_stagram_app/app/binding/init_binding.dart';
import 'package:ae_stagram_app/app/route/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

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
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitBinding(),
      getPages: AppPages.pages,
      initialRoute: Routes.INITIAL,
    );
  }
}
