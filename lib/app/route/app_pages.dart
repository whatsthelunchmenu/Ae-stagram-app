import 'package:ae_stagram_app/app/root.dart';
import 'package:ae_stagram_app/app/ui/android/detail/comment_detail.dart';
import 'package:ae_stagram_app/app/ui/android/mypage/mypage.dart';
import 'package:ae_stagram_app/app/ui/android/new_story/new_story.dart';
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
    ),
    GetPage(
      name: Routes.NEWPAGE,
      page: () => NewStory(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.COMMENT_DETAIL,
      page: () => CommentDetail(),
      transition: Transition.fade,
    )
  ];
}
