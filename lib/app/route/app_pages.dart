import 'package:ae_stagram_app/app/root.dart';
import 'package:ae_stagram_app/app/ui/android/pages.dart'
    show CommentDetail, Home, MyPage, NewStory, ModifyStory;
import 'package:get/route_manager.dart';
part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => Root(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => Home(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.MYPAGE,
      page: () => MyPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.NEWPAGE,
      page: () => NewStory(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.MODIFYPAGE,
      page: () => ModifyStory(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.COMMENT_DETAIL,
      page: () => CommentDetail(),
      transition: Transition.fade,
    )
  ];
}
