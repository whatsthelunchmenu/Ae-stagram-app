import 'package:ae_stagram_app/app/controller/controllers.dart'
    show AuthController;
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(AuthController.to.user!.photoURL ??
                  "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"),
            ),
            accountName: Text(AuthController.to.user!.displayName ?? ""),
            accountEmail: Text(AuthController.to.user!.email ?? ""),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: mainColor,
            ),
          ),
          TextButton(
            onPressed: () async {
              await AuthController.to.googleSignOut();
            },
            child: Text('LogOut'),
          ),
        ],
      ),
      elevation: 0.0,
    );
  }
}
