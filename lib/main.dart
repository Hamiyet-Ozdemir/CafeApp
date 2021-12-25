import 'package:cafeapp/deneme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafeapp/Pages/HomePage/HomePageView.dart';
import 'package:cafeapp/Pages/RegisterPage/RegisterView.dart';
import 'package:cafeapp/Pages/CafeDetailPage/CafeDetailView.dart';
import 'package:cafeapp/Pages/CafeMenuPage/CafeMenuView.dart';
import 'Pages/Admin/AdminSignUpPage/AdminRegisterView.dart';
import 'Pages/CodeVerificationPage/CodeVerificationView.dart';
import 'Pages/CommentDetailPage/CommentDetailView.dart';
import 'Pages/CreateCommentPage/CreateCommentView.dart';
import 'Pages/VerificationPage/VerificationView.dart';
import 'Pages/UserRezervationPege/UserRezervationView.dart';
import 'Pages/MakeRezervation/MakeRezervationView.dart';
import 'Pages/UserPasswordChanging/UserPasswordChangingView.dart';
import 'Pages/userProfileUpdateInfo/userProfileUpdateInfoView.dart';
import 'Pages/UpdateRezervation/updateRezervationView.dart';
import 'Pages/passwordChanging/passwordChangingView.dart';
import 'Pages/Admin/AddCafe/AddCafeView.dart';
import 'Pages/Admin/AdminCafeDetailState/AdminCafeDetailView.dart';
import 'Pages/Admin/AdminCafeMenuPage/AdminCafeMenuView.dart';
import 'Pages/Admin/AdminRezervationPage/AdminRezervationView.dart';
import 'Pages/Admin/AdminProfilePage/AdminProfileView.dart';
import 'Pages/Admin/AdminCommentDetailPage/AdminCommentDetailView.dart';
import 'Pages/Admin/SignInPage/SignInPage.dart';
import 'deneme.dart';


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
