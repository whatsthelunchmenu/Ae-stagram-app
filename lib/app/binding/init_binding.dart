import 'package:ae_stagram_app/app/controller/root_controller.dart';
import 'package:get/instance_manager.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RootController>(RootController(), permanent: true);
  }
}
