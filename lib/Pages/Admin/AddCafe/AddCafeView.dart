import 'dart:io';

import 'package:easy_folder_picker/FolderPicker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

//deneme
//hhh
class AddCafeState extends StatefulWidget {
  @override
  _AddCafeState createState() => _AddCafeState();
}

class _AddCafeState extends State<AddCafeState> {
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
        backgroundColor: Color(0xFFECEEF5),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 38),
                  padding: EdgeInsets.only(top: 38),
                  alignment: Alignment.topCenter,
                  child: Text('Kafe Ekle',
                      style: GoogleFonts.roboto(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 37, bottom: 5),
                  padding: EdgeInsets.only(left: 16),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Kafenin Adı",
                        hintStyle: TextStyle(
                            color: Colors.grey[400], fontSize: 18.75)),
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
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Kafenin Adresi",
                        hintStyle: TextStyle(
                            color: Colors.grey[400], fontSize: 18.75)),
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
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Kasa Id",
                        hintStyle: TextStyle(
                            color: Colors.grey[400], fontSize: 18.75)),
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
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Açılış Saati",
                        hintStyle: TextStyle(
                            color: Colors.grey[400], fontSize: 18.75)),
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
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Kapanış Saati",
                        hintStyle: TextStyle(
                            color: Colors.grey[400], fontSize: 18.75)),
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
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Açıklama",
                        hintStyle: TextStyle(
                            color: Colors.grey[400], fontSize: 18.75)),
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
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  padding: EdgeInsets.only(left: 16),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Telefon Numarası",
                        hintStyle: TextStyle(
                            color: Colors.grey[400], fontSize: 18.75)),
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
                                hintText: "Kafe Fotoğrafı",
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
                              Icons.photo_library,
                            ),
                            elevation: 8,
                            onPressed: () {
                              _getFromGallery();
                            },
                          ),
                        )
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.9,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 118, 24, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Kafe Ekle",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
