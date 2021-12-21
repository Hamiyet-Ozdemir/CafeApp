import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/Views/Register/ChangePasswordPage/passwordChangingView.dart';

class VerificationState extends StatelessWidget {
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
                child: Text('Şifremi Unuttum',
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 45),
                padding: EdgeInsets.only(left: 26, right: 26),
                child: Text(
                  "   Lütfen E-mail adresinizi giriniz. Size bir doğrulama kodu gönderilecektir",
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => passwordChanging(
                     
                      ),
                    ),
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
                      "Doğrulama Kodu Gönder",
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
}
