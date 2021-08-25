import 'package:ae_stagram_app/app/controller/auth/auth_controller.dart';
import 'package:ae_stagram_app/app/controller/logger_controller.dart';

class BaseClient {
  static Future getToken() async {
    final idToken = AuthController.to.user?.getIdToken().then(
          (value) => LoggerController.to.logger.i("[getIdToken] : $value"),
        );
    return idToken;
  }

  static getHeader() async {
    String token = await getToken();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token',
    };
  }
}
