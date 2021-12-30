import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCommentDetailState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 47),
              padding: EdgeInsets.only(top: 3, left: 12, right: 12),
              height: 50,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     GestureDetector(
                            onTap: ()  {
                           
                            Navigator.pop(context); } ,                       
                            child:
                    Image.asset(
                      "assets/images/butonimage.png",
                      height: 28,
                      width: 28,
                    ),),
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
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //comment
                      Container(
                          margin: EdgeInsets.only(top: 9),
                          width: MediaQuery.of(context).size.width * 0.93,
                          decoration: BoxDecoration(
                              color: Color(0xFFF8F8F8),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                height: 15,
                                width: MediaQuery.of(context).size.width * 0.93,
                                margin: EdgeInsets.only(
                                    left: 15, top: 18, bottom: 8),
                                child: new Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/Star.png",
                                      height: 15,
                                      width: 15,
                                    ),
                                    Image.asset(
                                      "assets/images/Star.png",
                                      height: 15,
                                      width: 15,
                                    ),
                                    Image.asset(
                                      "assets/images/Star.png",
                                      height: 15,
                                      width: 15,
                                    ),
                                    Image.asset(
                                      "assets/images/Star.png",
                                      height: 15,
                                      width: 15,
                                    ),
                                    Image.asset(
                                      "assets/images/Star_Empty.png",
                                      height: 15,
                                      width: 15,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 4),
                                      height: 15,
                                      child: Text('4.1',
                                          style: GoogleFonts.roboto(
                                            fontSize: 12,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                height: 15,
                                width: MediaQuery.of(context).size.width * 0.93,
                                margin: EdgeInsets.only(left: 15, bottom: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Ahmet Yılmaz",
                                        style: GoogleFonts.roboto(
                                          color: Color(0xFFF07618),
                                          fontSize: 14,
                                          //figma 12 yazıyodu kodda güncelledim fontsize ı
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 12),
                                      child: Text(
                                        "10 Kasım 2021 | 11:30",
                                        style: GoogleFonts.roboto(
                                          color: Color(0xFF7C7C7C),
                                          fontSize: 14,
                                          //figma 12 yazıyodu kodda güncelledim fontsize ı
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                child: Text(
                                  "Dinlendiren , otururken kendinizi ortamın sakinliğine ve hosluguna istemeden bıraktığınız bir mekan . Hayran olunasııı",
                                  style: GoogleFonts.roboto(
                                    color: Color(0xFF000000),
                                    fontSize: 14,
                                    //figma 12 yazıyodu burada da güncelledim fontsize ı
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                height: 26,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(bottom: 6),
                                padding: EdgeInsets.only(left: 270, right: 23),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "8",
                                      style: GoogleFonts.roboto(
                                        color: Color(0xFF000000),
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    Image.asset(
                                      "assets/images/like.png",
                                      height: 15,
                                      width: 15,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      "3",
                                      style: GoogleFonts.roboto(
                                        color: Color(0xFF000000),
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    Image.asset(
                                      "assets/images/unlike.png",
                                      height: 15,
                                      width: 15,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15, right: 98),
                                padding: EdgeInsets.only(left: 4),
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      hintText: "Yanıtla..",
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE3E0E0),
                                              width: 0)),
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 13)),
                                ),
                              ),
                            ],
                          )),

                      //answer
                      Container(
                          padding: EdgeInsets.only(left: 41),
                          width: MediaQuery.of(context).size.width * 0.93,
                          decoration: BoxDecoration(
                              color: Color(0xFFF8F8F8),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                height: 15,
                                width: MediaQuery.of(context).size.width * 0.93,
                                margin: EdgeInsets.only(
                                    left: 15, bottom: 8, top: 23),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Rüya Yılmaz",
                                        style: GoogleFonts.roboto(
                                          color: Color(0xFFF07618),
                                          fontSize: 14,
                                          //figma 12 yazıyodu kodda güncelledim fontsize ı
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 12),
                                      child: Text(
                                        "15 Kasım 2021 | 18:30",
                                        style: GoogleFonts.roboto(
                                          color: Color(0xFF7C7C7C),
                                          fontSize: 14,
                                          //figma 12 yazıyodu kodda güncelledim fontsize ı
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                child: Text(
                                  "Ben hizmetini beğenmedim. O kadar da hayran olunası değil...",
                                  style: GoogleFonts.roboto(
                                    color: Color(0xFF000000),
                                    fontSize: 14,
                                    //figma 12 yazıyodu burada da güncelledim fontsize ı
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                height: 26,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(bottom: 6),
                                padding: EdgeInsets.only(left: 100, right: 23),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "2",
                                      style: GoogleFonts.roboto(
                                        color: Color(0xFF000000),
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    Image.asset(
                                      "assets/images/like.png",
                                      height: 15,
                                      width: 15,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      "1",
                                      style: GoogleFonts.roboto(
                                        color: Color(0xFF000000),
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    Image.asset(
                                      "assets/images/unlike.png",
                                      height: 15,
                                      width: 15,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15, right: 98),
                                padding: EdgeInsets.only(left: 4),
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      hintText: "Yanıtla..",
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE3E0E0),
                                              width: 0)),
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 13)),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
