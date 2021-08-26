import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LoggerController extends GetxController {
  static LoggerController get to => Get.find();

  var logger = Logger();
}
