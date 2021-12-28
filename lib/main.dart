
import 'package:cafeapp/Pages/User/UserMakeRezervationPage/UserMakeRezervationView.dart';
import 'package:cafeapp/Pages/User/UserRezervationsPege/UserRezervationsView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pages/User/UserLoginPage/UserLoginView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: LoginState(),
    );
  }
}
