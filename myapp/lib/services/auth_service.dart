import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Google Sign In
  Future<UserCredential> signInWithGoogle() async {
    try {
      // begin interactive sign in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        throw Exception('User canceled the Google Sign-In process.');
      }

      // obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // create a new credential for the user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // sign in
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      if (e is PlatformException && e.code == 'network_error') {
        throw Exception('Network error occurred while signing in with Google.');
      } else {
        throw Exception('An error occurred while signing in with Google: $e');
      }
    }
  }
}
