import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'package:firebase_mobx/src/screens/home/home_screen.dart';
import 'package:firebase_mobx/src/stores/login/firebase_login_store.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    var _loginStore = Provider.of<FirebaseLoginStore>(context, listen: false);
    when(
      (_) => _loginStore.signedIn,
      () => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
    );
    return Scaffold(
      body: Center(
        child: RaisedButton(
          color: Theme.of(context).buttonTheme.colorScheme.primary,
          onPressed: () => _loginStore.signInWithGoogle(),
          child: Text('Sign In'),
        ),
      ),
    );
  }
}
