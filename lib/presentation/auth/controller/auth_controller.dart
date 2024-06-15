import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController{

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.showSnackbar(const GetSnackBar(message: "User not found",));
      } else if (e.code == 'invalid-credential') {
        Get.showSnackbar(const GetSnackBar(message: "Incorrect credentails",));
      }
      rethrow;
    }
  }
}