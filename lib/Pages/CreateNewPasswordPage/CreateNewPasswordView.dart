import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewPassword extends StatefulWidget {
  @override
  State<CreateNewPassword> createState() => _CreateNewPassword();
} //view

class _CreateNewPassword extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          Container(
            color: Color(0xFFFFFFFF),
            height: 118,
            child: Container(
              height: 29,
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 25,
                    width: 25,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/x_icon.png'),
                      fit: BoxFit.fill,
                    )),
                  ),

                  SizedBox(width: 77), //boşluk

                  Text("Ahmet Yılmaz",
                      style: GoogleFonts.roboto(
                        fontStyle: FontStyle.normal,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF07618),
                      )),
                ],
              ),
            ),
          ),
          Container(
            color: Color(0xFFFE5E5E5),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(top: 22),
                  alignment: Alignment.centerLeft,
                  height: 30,
                  child: Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/key_icon.png'),
                          fit: BoxFit.fill,
                        )),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        color: Colors.white,

                        width: 272,
                        padding: EdgeInsets.only(left: 16),
                        //height:,
                        child: TextField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Yeni Şifre",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 80), //
                  margin: EdgeInsets.only(top: 20),

                  alignment: Alignment.centerLeft,
                  height: 30,
                  child: Container(
                    color: Colors.white,

                    width: 272,
                    padding: EdgeInsets.only(left: 16),
                    //height:,
                    child: TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Yeni Şifre (Tekrar)",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 12)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 29),
                  height: 51,
                  width: 232,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 118, 24, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Oluştur",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    ));
  }
} //view