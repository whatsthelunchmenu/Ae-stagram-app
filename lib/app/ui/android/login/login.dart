import 'package:ae_stagram_app/app/controller/auth/auth_controller.dart';
import 'package:ae_stagram_app/app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          Container(
            child: Text(
              'Aestagram',
              style: GoogleFonts.indieFlower(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          Center(
            child: SignInButton(
              Buttons.Google,
              onPressed: () {
                AuthController.to.googleSignIn();
              },
            ),
          ),
          Spacer(flex: 4),
        ],
      ),
    );
  }
}
