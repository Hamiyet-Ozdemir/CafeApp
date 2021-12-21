import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CafeMenuState extends StatelessWidget {
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
              height: 80,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: new Row(children: [
                Image.asset(
                  "assets/images/butonimage.png",
                  height: 28,
                  width: 28,
                ),
                Container(
                  margin: EdgeInsets.only(left: 125),
                  alignment: Alignment.center,
                  child: Text('Menü',
                      style: GoogleFonts.roboto(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/images/cafemenu.png"),
                    Image.asset("assets/images/cafemenu.png"),
                    Image.asset("assets/images/cafemenu.png"),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

