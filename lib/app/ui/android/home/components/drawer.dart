import 'package:ae_stagram_app/app/controller/auth/auth_controller.dart';
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(),
            accountName: Text('ParkJuneWoo'),
            accountEmail: Text('junewoo@gmail.com'),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: mainColor,
            ),
          ),
          TextButton(
            onPressed: () {
              print(AuthController.to.user?.uid);
            },
            child: Text('LogOut'),
          ),
        ],
      ),
      elevation: 0.0,
    );
  }
}
