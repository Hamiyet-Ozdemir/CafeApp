import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCafeMenuState extends StatelessWidget {
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

        Flexible(child:   PDF(
                  enableSwipe: true,
        autoSpacing: false,
        pageFling: false,
      pageSnap: false,
      
                ).fromUrl(
               "https://firebasestorage.googleapis.com/v0/b/fir-c129d.appspot.com/o/cafeMenuPdf%2F6732573117962598893482664962668033329972.pdf?alt=media&token=2211e3e6-b054-4927-b6c2-9222ed60245d",

        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
        
      ),)
              
            
          ],
        ));
  }
}
