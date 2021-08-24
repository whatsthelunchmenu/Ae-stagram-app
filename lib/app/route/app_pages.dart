import 'package:ae_stagram_app/app/root.dart';
import 'package:ae_stagram_app/app/ui/android/mypage/mypage.dart';
import 'package:get/route_manager.dart';
part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => Root(),
    ),
    GetPage(
      name: Routes.MYPAGE,
      page: () => MyPage(),
      transition: Transition.fade,
    )
  ];
}
