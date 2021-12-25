import 'package:cafeapp/Pages/Admin/AdminUpdateProfileInfoPage/AdminUpdateProfileInfoView.dart';
import 'package:cafeapp/Pages/Admin/ForgetPasswordPage/ForgetPasswordView.dart';
import 'package:cafeapp/service/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminProfile extends StatefulWidget {
  @override
  _AdminProfileState createState() => _AdminProfileState();
}
class _AdminProfileState extends State<AdminProfile>{
  AuthService _authService=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FB),
      body: Column(
        children: <Widget> [
          Container(
              height: MediaQuery.of(context).size.height * 0.145,
              color: Color(0xFFFFFFFF),
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.023),
              alignment: Alignment.bottomCenter,
              child: Text(
                "Profil",
                style: GoogleFonts.roboto(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF07618)
                ),
              )
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child:
                    Container(
                      margin: EdgeInsets.only(top: 31,bottom: 50),
                        child:Text(
                      AuthService.adminName,
                      style: GoogleFonts.roboto(
                          fontSize: 24,
                          color: Color(0xFF000000)
                      ),
                    )
                    )
                  ),
 GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                adminProfileUpdateInfo(
                                            
                                            ),
                                          ),
                                        );
                                      },child:
                  Container(
                    width: MediaQuery.of(context).size.width,

                    color: Colors.white,
                    padding: EdgeInsets.only(left: 23,top: 13,bottom: 12),
                    child: Text(
                      "Bilgilerimi Güncelle",
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black
                      ),
                    ),
                  ),),
                   GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ForgetPasswordView(
                                            
                                            ),
                                          ),
                                        );
                                      },child:
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 22),
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 23,top: 13,bottom: 12),
                    child: Text(
                      "Şifre Değiştir",
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black
                      ),
                    ),
                  ),),
                     GestureDetector(
                                      onTap: () {
                                        _authService.signOut();
                                       
                                        
                                      },child:
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 22),
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 23,top: 13,bottom: 12),
                    child: Text(
                      "Çıkış Yap",
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Color(0xFFE41A1A)
                      ),
                    ),
                  ),)



                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}