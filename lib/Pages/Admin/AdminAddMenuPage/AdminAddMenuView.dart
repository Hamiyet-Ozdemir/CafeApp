import 'dart:io';

import 'package:easy_folder_picker/FolderPicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';




class AdminCafeMenuState extends StatefulWidget {
  @override
  _AdminCafeMenuState createState() => _AdminCafeMenuState();
}

class _AdminCafeMenuState extends State<AdminCafeMenuState> {
  Directory selectedDirectory;

final myController = TextEditingController();
_getFromGallery() async {
  PickedFile pickedFile = await ImagePicker().getImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    File imageFile = File(pickedFile.path);
    myController.text = imageFile.toString();
  }
}
  Future<void> _pickDirectory(BuildContext context) async {
    Directory directory = selectedDirectory;
    if (directory == null) {
      directory = Directory(FolderPicker.ROOTPATH);
    }

    Directory newDirectory = await FolderPicker.pick(
        allowFolderCreation: true,
        context: context,
        rootDirectory: directory,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))));
    setState(() {
      selectedDirectory = newDirectory;
      print(selectedDirectory);
    });
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
                            controller: myController,
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
                              _pickDirectory(context);
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
               "https://firebasestorage.googleapis.com/v0/b/fir-c129d.appspot.com/o/cafeMenuPdf%2F6732573117962598893482664962668033329972.pdf?alt=media&token=2211e3e6-b054-4927-b6c2-9222ed60245d",

        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
        
      ),)
          ],
        )

    );
  }
}