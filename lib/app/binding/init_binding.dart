import 'package:ae_stagram_app/app/controller/auth/auth_controller.dart';
import 'package:ae_stagram_app/app/controller/logger/logger_controller.dart';
import 'package:ae_stagram_app/app/controller/root_controller.dart';
import 'package:get/instance_manager.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RootController>(RootController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<LoggerController>(LoggerController(), permanent: true);
  }
}
