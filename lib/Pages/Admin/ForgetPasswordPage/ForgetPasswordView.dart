import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';



class ForgetPasswordView extends StatefulWidget {
  @override
  State<ForgetPasswordView> createState() => _forgetPasswordState();
} //view

class _forgetPasswordState extends State<ForgetPasswordView> {
  TextEditingController email=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEEF5),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 38),
                padding: EdgeInsets.only(top: 38),
                alignment: Alignment.topCenter,
                child: Text('Şifre Değiştir',
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 45),
                padding: EdgeInsets.only(left: 26, right: 26),
                child: Text(
                  "   Lütfen E-mail adresinizi giriniz. Şifre değiştirme linki gönderilecektir",
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35),
                padding: EdgeInsets.only(left: 16, top: 5),
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: TextField(
                  controller: email,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "E-mail",
                      hintStyle:
                          TextStyle(color: Colors.grey[400], fontSize: 18.75)),
                ),
              ),
              GestureDetector(
                onTap: () {
                FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);

                  Navigator.pop(
                    context,
                   
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 24),
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.9,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 118, 24, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Şifre Değiştirme Linki Gönder",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} //view