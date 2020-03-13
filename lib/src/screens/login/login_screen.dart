import 'package:firebase_mobx/src/screens/home/home_screen.dart';
import 'package:firebase_mobx/src/stores/login/firebase_login_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseLoginStore _loginStore;
  ReactionDisposer _loginListenDisposer;

  @override
  void initState() {
    _loginStore = Provider.of<FirebaseLoginStore>(context, listen: false);
    _loginListenDisposer = when(
      (_) => _loginStore.signedIn,
      () => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
    );
    super.initState();
  }

  @override
  void dispose() {
    _loginListenDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
