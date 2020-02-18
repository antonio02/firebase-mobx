import 'package:firebase_mobx/home.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'src/stores/firebase_login_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseLoginStore _loginStore;

  @override
  void initState() {
    super.initState();
    _loginStore = FirebaseLoginStore();
    autorun((_) {
      if (_loginStore.signedIn) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () => _loginStore.signInWithGoogle(),
          child: Text('Login'),
        ),
      ),
    );
  }
}
