import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  late final GoogleSignIn _googleSignin;
  late final FirebaseAuth _auth;
  RxBool isLoading = false.obs;

  void onInit() {
    super.onInit();
    _googleSignin = GoogleSignIn();
    _auth = FirebaseAuth.instance;
  }

  Future googleSignIn() async {
    isLoading.value = true;
    GoogleSignInAccount? googleUser = await _googleSignin.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    User? user = (await _auth.signInWithCredential(credential)).user;
    isLoading.value = false;

    return user;
  }
}
