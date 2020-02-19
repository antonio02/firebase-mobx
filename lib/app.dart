import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:firebase_mobx/src/screens/home/home_screen.dart';
import 'package:firebase_mobx/src/screens/login/login_screen.dart';
import 'package:firebase_mobx/src/stores/login/firebase_login_store.dart';

Map<String, Widget Function(BuildContext)> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
};

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => FirebaseLoginStore(),
      child: MaterialApp(
        title: 'Firebase MobX',
        theme: ThemeData(
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            colorScheme: Theme.of(context).buttonTheme.colorScheme.copyWith(
                  primary: Colors.green,
                  error: Colors.red,
                ),
          ),
        ),
        initialRoute: LoginScreen.routeName,
        routes: routes,
      ),
    );
  }
}
