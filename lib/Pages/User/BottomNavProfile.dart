import 'package:cafeapp/Pages/User/UserLoginPage/UserLoginView.dart';
import 'package:cafeapp/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'UserRezervationsPege/UserRezervationsView.dart';
import 'UserUpdateProfileInfoPage/UserUpdateProfileInfoView.dart';
import 'package:percent_indicator/percent_indicator.dart';
void _showToast(BuildContext context, String msg) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(msg),
    ),
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color(0xFFF7F8FB),
        body: Column(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.145,
                color: Color(0xFFFFFFFF),
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.023),
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Profil",
                  style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF07618)),
                )),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                         child: new CircularPercentIndicator(
                  radius: 120.0,
                  lineWidth: 12.0,
                  percent: double.parse(AuthService.userPoint)/100,
                  backgroundColor: Colors.grey,
                  center: new Text(AuthService.userPoint,style: TextStyle(fontSize: 40,color: Color.fromRGBO(27, 124, 162, 1)),),
                  progressColor: Color.fromRGBO(255, 143, 11, 1),
                  circularStrokeCap: CircularStrokeCap.square,
                  animation: true,
                  animationDuration: 1200,
                  
                  
                ),
                        ),
                        Text(
                          "Puan",
                          style: GoogleFonts.roboto(
                              fontSize: 12, color: Color(0xFFB6B7C8)),
                        ),
                        SizedBox(height: 3),
                        Text(
                          AuthService.userName,
                          style: GoogleFonts.roboto(
                              fontSize: 24, color: Color(0xFF000000)),
                        )
                      ]),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserRezervationsState(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 22),
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 23, top: 13, bottom: 12),
                        child: Text(
                          "Rezervasyonlarım",
                          style: GoogleFonts.roboto(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserUpdateProfileInfo(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 22),
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 23, top: 13, bottom: 12),
                        child: Text(
                          "Bilgilerimi Güncelle",
                          style: GoogleFonts.roboto(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance.sendPasswordResetEmail(
                            email: FirebaseAuth.instance.currentUser.email);
                        _showToast(context,
                            "Şifre Değiştirme Linki Mail Adresinize Gönderildi");
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 22),
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 23, top: 13, bottom: 12),
                        child: Text(
                          "Şifre Değiştir",
                          style: GoogleFonts.roboto(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await AuthService().signOut();
                        Navigator.of(context).pushAndRemoveUntil(
                            new MaterialPageRoute(
                                builder: (context) => new LoginState()),
                            (route) => false);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 22),
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 23, top: 13, bottom: 12),
                        child: Text(
                          "Çıkış Yap",
                          style: GoogleFonts.roboto(
                              fontSize: 16, color: Color(0xFFE41A1A)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
