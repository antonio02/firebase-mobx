import 'dart:developer';

import 'package:mobx/mobx.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:firebase_auth/firebase_auth.dart';

part 'firebase_login_store.g.dart';

class FirebaseLoginStore = FirebaseLoginBase with _$FirebaseLoginStore;

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

abstract class FirebaseLoginBase with Store {
  @observable
  bool signedIn = false;

  @observable
  FirebaseUser currentUser;

  FirebaseLoginBase() {
    _auth.onAuthStateChanged.listen((user) {
      log('user: ${user?.displayName ?? 'null'}');
      if (user == null || user.isAnonymous) {
        signedIn = false;
        currentUser = null;
      } else {
        signedIn = true;
        currentUser = user;
      }
    });
  }

  @action
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);
  }

  @action
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
