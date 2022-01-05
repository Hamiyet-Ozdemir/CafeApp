import 'dart:io';
import 'dart:math';

import 'package:cafeapp/service/auth.dart';
import 'package:easy_folder_picker/FolderPicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';




class AdminCafeMenu extends StatefulWidget {
  final String url;
  final String cafeId;
  AdminCafeMenu(String url,String cafeId) : this.url = url,this.cafeId=cafeId;
  @override
  _AdminCafeMenuState createState() => _AdminCafeMenuState(url,cafeId);
}

class _AdminCafeMenuState extends State<AdminCafeMenu> {
  Directory selectedDirectory;
   _AdminCafeMenuState(this.url,this.cafeId);

  //cafe id çek burada
  final String url;
  final String cafeId;
final myPdfController = TextEditingController();
File file;

void _getDocuments() async {
  
 
   FilePickerResult result = await FilePicker.platform.pickFiles( type: FileType.custom,
      allowedExtensions: ['pdf']);
file=File(result.paths.first);
  
 
 
  myPdfController.text=result.paths.first;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(247, 248, 251, 1),
        body:Column(
          children:<Widget> [
            Container(
              margin: EdgeInsets.only(top: 47),
              padding: EdgeInsets.only(top: 3,left: 12,right: 12),
              height: 50,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[  GestureDetector(
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
                      child: Text(
                          'Starbucks Coffe',
                          style: GoogleFonts.roboto(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ),GestureDetector(
                      onTap: () {
                                              AuthService().updateMenu(cafeId, file);
                                              Navigator.pop(context);
                                            },
                      child:
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
                    ))
                  ]
              ),

            ),
             Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    padding: EdgeInsets.only(left: 16),
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          child: TextField(
                            readOnly: true,
                            controller: myPdfController,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Menü(Pdf)",
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 18.75)),
                          ),
                        ),
                        
                           Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.9 - 216,
                          alignment: Alignment.centerRight,
                          child: RawMaterialButton(
                            child: Icon(
                              Icons.picture_as_pdf,
                            ),
                            elevation: 8,
                            onPressed: () {
                              _getDocuments();
                            },
                          ),
                        )
                      ],
                    )),
             Flexible(child:   PDF(
                  enableSwipe: true,
        autoSpacing: false,
        pageFling: false,
      pageSnap: false,
      
                ).fromUrl(
               url,

        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
        
      ),)
          ],
        )

    );
  }
}