import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'firebase_login_store.g.dart';

class FirebaseLoginStore = _FirebaseLoginBase with _$FirebaseLoginStore;

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

var _logger = Logger();

abstract class _FirebaseLoginBase with Store {
  @observable
  bool signedIn = false;

  @observable
  FirebaseUser currentUser;

  _FirebaseLoginBase() {
    _auth.currentUser();
    _auth.onAuthStateChanged.listen((user) {
      if (user == null) {
        signedIn = false;
        currentUser = null;
        _logger.i('User Signed Out');
      } else {
        signedIn = true;
        currentUser = user;
        _logger.i('User: ${user.uid} (Signed In)');
      }
    });
  }

  @action
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
    }
  }

  @action
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
