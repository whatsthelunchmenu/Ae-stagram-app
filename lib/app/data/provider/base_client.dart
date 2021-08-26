import 'package:ae_stagram_app/app/controller/auth/auth_controller.dart';
import 'package:ae_stagram_app/app/controller/logger/logger_controller.dart';

class BaseClient {
  static Future<String> getToken() async {
    final user = AuthController.to.user;
    if (user != null) {
      final idToken = user.getIdToken();
      return idToken;
    }
    return "";
  }

  static Future<Map<String, dynamic>> getHeader() async {
    String token = await getToken();
    LoggerController.to.logger.i("[Token] : $token");
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token',
    };
  }
}
