import 'package:ae_stagram_app/app/data/repository/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  late final GoogleSignIn _googleSignin;
  late final FirebaseAuth _auth;
  late AuthReposiory repository;
  RxBool isLoading = false.obs;
  Rx<User?> _firebaseUser = Rx<User?>(FirebaseAuth.instance.currentUser);

  void onInit() {
    super.onInit();
    _googleSignin = GoogleSignIn();
    _auth = FirebaseAuth.instance;
    _firebaseUser.bindStream(_auth.authStateChanges());
    repository = AuthReposiory();
  }

  User? get user => _firebaseUser.value;

  Future googleSignIn() async {
    try {
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
    } catch (error) {
      Get.snackbar(
        "Error Google signing in",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      isLoading.value = false;
    }
  }

  Future googleSignOut() async {
    try {
      _auth.signOut();
    } catch (error) {
      Get.snackbar(
        "Error signing out",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future login() async {
    repository.login();
  }
}
