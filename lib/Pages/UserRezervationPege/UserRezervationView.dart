import 'package:cafeapp/Pages/UpdateRezervation/updateRezervationView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserRezervationState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 47),
              padding: EdgeInsets.only(top: 3, left: 12, right: 12),
              height: 118,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: new Row(children: [
                Image.asset(
                  "assets/images/butonimage.png",
                  height: 28,
                  width: 28,
                ),
                Container(
                  margin: EdgeInsets.only(left: 58),
                  child: Text('Rezervasyonlar',
                      style: GoogleFonts.roboto(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        color: Color.fromRGBO(244, 245, 248, 1),
                        height: 121,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,

                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 11, left: 27, bottom: 8),
                                        alignment: Alignment.centerLeft,
                                        child: Text("İsim: Ahmet Yılmaz"),
                                      ),
                                      GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                updateRezervation(
                                            
                                            ),
                                          ),
                                        );
                                      },child:  Container(
                                         margin: EdgeInsets.only(
                                           left: 180),
                                        child:
                                      Image.asset(
                                        "assets/images/duzenle.png",
                                        height: 20,
                                        width: 20,
                                      )),),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child:
                                      Image.asset(
                                          "assets/images/butonimage.png",
                                          height: 20,
                                          width: 20,
                                          alignment: Alignment.centerRight)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Kişi Sayısı: 5"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Zaman: 21.00"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Ekstra Not: Cam kenarı ayırabilir misiniz?"),
                            ),
                          ],
                        ),
                      ), Container(
                        margin: EdgeInsets.only(bottom: 8),
                        color: Color.fromRGBO(244, 245, 248, 1),
                        height: 121,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,

                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 11, left: 27, bottom: 8),
                                        alignment: Alignment.centerLeft,
                                        child: Text("İsim: Ahmet Yılmaz"),
                                      ),
                                      Container(
                                         margin: EdgeInsets.only(
                                           left: 180),
                                        child:
                                      Image.asset(
                                        "assets/images/duzenle.png",
                                        height: 20,
                                        width: 20,
                                      )),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child:
                                      Image.asset(
                                          "assets/images/butonimage.png",
                                          height: 20,
                                          width: 20,
                                          alignment: Alignment.centerRight)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Kişi Sayısı: 5"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Zaman: 21.00"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Ekstra Not: Cam kenarı ayırabilir misiniz?"),
                            ),
                          ],
                        ),
                      ), Container(
                        margin: EdgeInsets.only(bottom: 8),
                        color: Color.fromRGBO(244, 245, 248, 1),
                        height: 121,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,

                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 11, left: 27, bottom: 8),
                                        alignment: Alignment.centerLeft,
                                        child: Text("İsim: Ahmet Yılmaz"),
                                      ),
                                      Container(
                                         margin: EdgeInsets.only(
                                           left: 180),
                                        child:
                                      Image.asset(
                                        "assets/images/duzenle.png",
                                        height: 20,
                                        width: 20,
                                      )),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child:
                                      Image.asset(
                                          "assets/images/butonimage.png",
                                          height: 20,
                                          width: 20,
                                          alignment: Alignment.centerRight)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Kişi Sayısı: 5"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Zaman: 21.00"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Ekstra Not: Cam kenarı ayırabilir misiniz?"),
                            ),
                          ],
                        ),
                      ), Container(
                        margin: EdgeInsets.only(bottom: 8),
                        color: Color.fromRGBO(244, 245, 248, 1),
                        height: 121,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,

                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 11, left: 27, bottom: 8),
                                        alignment: Alignment.centerLeft,
                                        child: Text("İsim: Ahmet Yılmaz"),
                                      ),
                                      Container(
                                         margin: EdgeInsets.only(
                                           left: 180),
                                        child:
                                      Image.asset(
                                        "assets/images/duzenle.png",
                                        height: 20,
                                        width: 20,
                                      )),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child:
                                      Image.asset(
                                          "assets/images/butonimage.png",
                                          height: 20,
                                          width: 20,
                                          alignment: Alignment.centerRight)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Kişi Sayısı: 5"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Zaman: 21.00"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Ekstra Not: Cam kenarı ayırabilir misiniz?"),
                            ),
                          ],
                        ),
                      ), Container(
                        margin: EdgeInsets.only(bottom: 8),
                        color: Color.fromRGBO(244, 245, 248, 1),
                        height: 121,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,

                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 11, left: 27, bottom: 8),
                                        alignment: Alignment.centerLeft,
                                        child: Text("İsim: Ahmet Yılmaz"),
                                      ),
                                      Container(
                                         margin: EdgeInsets.only(
                                           left: 180),
                                        child:
                                      Image.asset(
                                        "assets/images/duzenle.png",
                                        height: 20,
                                        width: 20,
                                      )),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child:
                                      Image.asset(
                                          "assets/images/butonimage.png",
                                          height: 20,
                                          width: 20,
                                          alignment: Alignment.centerRight)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Kişi Sayısı: 5"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Zaman: 21.00"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Ekstra Not: Cam kenarı ayırabilir misiniz?"),
                            ),
                          ],
                        ),
                      ), Container(
                        margin: EdgeInsets.only(bottom: 8),
                        color: Color.fromRGBO(244, 245, 248, 1),
                        height: 121,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,

                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 11, left: 27, bottom: 8),
                                        alignment: Alignment.centerLeft,
                                        child: Text("İsim: Ahmet Yılmaz"),
                                      ),
                                      Container(
                                         margin: EdgeInsets.only(
                                           left: 180),
                                        child:
                                      Image.asset(
                                        "assets/images/duzenle.png",
                                        height: 20,
                                        width: 20,
                                      )),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child:
                                      Image.asset(
                                          "assets/images/butonimage.png",
                                          height: 20,
                                          width: 20,
                                          alignment: Alignment.centerRight)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Kişi Sayısı: 5"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Zaman: 21.00"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Ekstra Not: Cam kenarı ayırabilir misiniz?"),
                            ),
                          ],
                        ),
                      ), Container(
                        margin: EdgeInsets.only(bottom: 8),
                        color: Color.fromRGBO(244, 245, 248, 1),
                        height: 121,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,

                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 11, left: 27, bottom: 8),
                                        alignment: Alignment.centerLeft,
                                        child: Text("İsim: Ahmet Yılmaz"),
                                      ),
                                      Container(
                                         margin: EdgeInsets.only(
                                           left: 180),
                                        child:
                                      Image.asset(
                                        "assets/images/duzenle.png",
                                        height: 20,
                                        width: 20,
                                      )),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child:
                                      Image.asset(
                                          "assets/images/butonimage.png",
                                          height: 20,
                                          width: 20,
                                          alignment: Alignment.centerRight)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Kişi Sayısı: 5"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Zaman: 21.00"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Ekstra Not: Cam kenarı ayırabilir misiniz?"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
