import 'package:cafeapp/deneme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pages/Admin/AdminSignUpPage/AdminSignUpView.dart';
import 'Pages/Admin/AdminProfilePage/AdminProfileView.dart';
import 'Pages/Admin/AdminCommentDetailPage/AdminCommentDetailView.dart';
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
