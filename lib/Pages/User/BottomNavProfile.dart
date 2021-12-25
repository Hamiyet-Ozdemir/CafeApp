import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'UserChangePasswordPage/UserChangePasswordView.dart';
import 'UserRezervationsPege/UserRezervationsView.dart';
import 'UserUpdateProfileInfoPage/UserUpdateProfileInfoView.dart';

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
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.only(top: 7, bottom: 2),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/userPoint.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          "Puan",
                          style: GoogleFonts.roboto(
                              fontSize: 12, color: Color(0xFFB6B7C8)),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Ahmet Yılmaz",
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
                    ),),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserChangePassword(
                             
                            ),
                          ),
                        );
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
                    Container(
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
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
