import 'package:firebase_mobx/src/screens/login/login_screen.dart';
import 'package:firebase_mobx/src/stores/login/firebase_login_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseLoginStore _loginStore;
  ReactionDisposer _loginListenDisposer;

  @override
  void initState() {
    _loginStore = Provider.of<FirebaseLoginStore>(context, listen: false);
    _loginListenDisposer = when(
      (_) => !_loginStore.signedIn,
      () => Navigator.pushReplacementNamed(context, LoginScreen.routeName),
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
          color: Theme.of(context).buttonTheme.colorScheme.error,
          onPressed: () => _loginStore.signOut(),
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}
