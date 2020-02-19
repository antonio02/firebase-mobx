import 'package:firebase_mobx/src/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'package:firebase_mobx/src/stores/login/firebase_login_store.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    var _loginStore = Provider.of<FirebaseLoginStore>(context, listen: false);
    when(
      (_) => !_loginStore.signedIn,
      () => Navigator.pushReplacementNamed(context, LoginScreen.routeName),
    );
    return Scaffold(
      body: Center(
        child: RaisedButton(
          color: Theme.of(context).buttonTheme.colorScheme.error,
          onPressed: () => _loginStore.signOut(),
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}
