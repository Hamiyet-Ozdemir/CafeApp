import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminCafeRezervationDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(top: 3, left: 12, right: 12),
              height: 74,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: new Column(
                children: [
                  Container(
                    height: 30,
                    alignment: Alignment.bottomCenter,
                    child: new Row(children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(bottom: 0),
                        child: Image.asset(
                          "assets/images/butonimage.png",
                          height: 28,
                          width: 28,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(left: 80, bottom: 9),
                        child: Text('Starbucks Coffe',
                            style: GoogleFonts.roboto(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ]),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only( top: 15),
                    child: Text('Rezervasyonlar',
                        style: GoogleFonts.roboto(
                          fontSize: 17,
                        )),
                  )
                ],
              ),
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
                              child: Text("Tarih:10.11.2021 21.00"),
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
                              child: Text("Tarih:10.11.2021 21.00"),
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
                              child: Text("Tarih:10.11.2021 21.00"),
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
                              child: Text("Tarih:10.11.2021 21.00"),
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
                              child: Text("Tarih:10.11.2021 21.00"),
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
                              child: Text("Tarih:10.11.2021 21.00"),
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
                              child: Text("Tarih:10.11.2021 21.00"),
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
