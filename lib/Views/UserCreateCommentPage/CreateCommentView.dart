import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateCommentState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FB),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 44),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            child: Container(
                margin: EdgeInsets.only(top: 0,bottom: 15),
                padding: EdgeInsets.only(top: 3, left: 12, right: 12),
                height: MediaQuery.of(context).size.height * 0.177,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                context,
                              );
                            },
                            child: Image.asset(
                      "assets/images/butonimage.png",
                      height: 28,
                      width: 28,
                    ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 56),
                            height: 28,
                            child: Text('Starbucks Coffe',
                                style: GoogleFonts.roboto(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 27),
                            height: 28,
                            width: 72,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              color: Color(0xFF1B7CA2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Yayınla",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ]),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 25, top: 9),
                      child: Text(
                        "Ahmet Yılmaz",
                        style: GoogleFonts.roboto(
                            fontSize: 20, color: Color(0xFFF07618)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 13),
                      alignment: Alignment.centerRight,
                      height: 20,
                      width: 261,
                      child: Row(
                        children: [
                           Image.asset(
                                      "assets/images/Star_Empty.png",
                                      height: 15,
                                      width: 15,
                                    ),
                          SizedBox(width: 13),
                          Image.asset(
                                      "assets/images/Star_Empty.png",
                                      height: 15,
                                      width: 15,
                                    ),
                          SizedBox(width: 13),
                          Image.asset(
                                      "assets/images/Star_Empty.png",
                                      height: 15,
                                      width: 15,
                                    ),
                          SizedBox(width: 13),
                          Image.asset(
                                      "assets/images/Star_Empty.png",
                                      height: 15,
                                      width: 15,
                                    ),
                          SizedBox(width: 13),
                          Image.asset(
                            "assets/images/Star_Empty.png",
                            height: 15,
                            width: 15,
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      //color: Color(0xFF000000),
                      alignment: Alignment.centerLeft,

                      height: 18,
                      margin: EdgeInsets.only(top: 12, bottom: 8),
                      padding: EdgeInsets.only(left: 33),
                      child: Text(
                        "Deneyiminizi Paylaşın",
                        style: GoogleFonts.roboto(fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12, right: 12),
                      padding: EdgeInsets.only(left: 21, right: 14),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.294,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Color(0xFFFFFFFF)),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Yorumunuzu buraya yazın..",
                            hintStyle: TextStyle(
                                color: Colors.grey[400], fontSize: 13)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
