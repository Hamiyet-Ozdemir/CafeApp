

import 'package:cafeapp/service/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class AdminUpdateOffer extends StatefulWidget {
  final String cafeId;

  const AdminUpdateOffer(this.cafeId,{Key key}) : super(key: key);

  @override
  State<AdminUpdateOffer> createState() => AdminUpdateOfferState(cafeId);
} //view

class AdminUpdateOfferState extends State<AdminUpdateOffer> {

  //kampanya sayfasında eğer kampanya eklemeye basarsa =>
  // 1- önce offerModel içindeki  createString(String cafeId) fonksiyonunu çalıştır ve parametre olarak cafeId gönder
  // 2- AdminUpdateOffer(cafeId) klasına cafe id yi vererek navigate et

  //update yapmak için parametreleri offermodel deki updateoffer a gönder çalıştır sonra sayfaya cafe id ile gel

  AdminUpdateOfferState(String cafeId){this.cafeId=cafeId;}
  String cafeId;
  String setButton="Yayınla";
  final TextEditingController offerTitle=TextEditingController();
  final TextEditingController offerDetail=TextEditingController();
  final TextEditingController offerTag=TextEditingController();
  final TextEditingController description=TextEditingController();
  final TextEditingController picturePath=TextEditingController();

  String offerTitleHintText="Kampanya Başlığı";
  String offerDetailHintText="Kampanta Detayı";
  String offerTagHintText="Etiket";
  String descriptionHintText="Ek Açıklama";
  String picturePathHintText="Kampanya Resmi";

  PickedFile pickedFile;
  File file;
  final myImageController = TextEditingController();

  _getFromGallery() async {
    pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      myImageController.text = imageFile.toString();
      picturePath.text= imageFile.toString();

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          body: Container(
              child:Column(
                children: [
                  Container(
                    color: Color(0xFFFFFFFF),
                    height: 118,
                    child: Container(
                      height: 29,
                      padding:EdgeInsets.fromLTRB(10,50,5,0),//dikkat
                      child: Column(
                        children: [
                          Row(
                            children:<Widget> [
                               GestureDetector(
                            onTap: ()  {
                           
                            Navigator.pop(context); } ,                       
                            child:
                              Container(
                                height:25,
                                width: 25,
                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/butonimage.png'
                                      ),
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),),
                              SizedBox(width: 57), //boşluk
                              Text("Starbucks Coffe",
                                  style: GoogleFonts.roboto(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )
                              ),
                             GestureDetector(
                               onTap:() {
                                 AuthService().createOffer(cafeId,offerTitle.text, offerDetail.text, offerTag.text, description.text, File(pickedFile.path));
                                 Navigator.pop(context);
                               },
                               child:  Container(
                                 margin: EdgeInsets.only(left: 28),
                                 height: 32,
                                 width: 70,
                                 alignment: Alignment.bottomCenter,
                                 decoration: BoxDecoration(
                                   color: Color(0xFF1B7CA2),
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 child: Center(
                                   child: Text(
                                     setButton,
                                     style: TextStyle(
                                         color: Colors.white,
                                         fontWeight: FontWeight.bold),
                                   ),
                                 ),
                               ),
                             ),
                            ],
                          ) ,
                          Container(
                            margin: EdgeInsets.fromLTRB(4, 0,40, 0),
                            child:Text("Kampanya Düzenle",
                              style: GoogleFonts.roboto(
                                color: Color(0xFF606060),
                                fontSize: 15,
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                    //başlık Container

                  ),
                  Expanded(
                    child:  SingleChildScrollView(
                        child:Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color:Color(0xFFF7F8FB),
                          child: Column(
                            children: [
                              Container(
                                color: Colors.white,
                                width:MediaQuery.of(context).size.width*0.85,
                                margin: EdgeInsets.only(top:47,bottom:20),
                                padding: EdgeInsets.only(left: 15),
                                height:40,
                                child: TextField(
                                  controller: offerTitle,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: offerTitleHintText,
                                      hintStyle: TextStyle(
                                          color: Color(0xFFB6B7C8),
                                          fontSize: 16)),
                                ),
                              ),
                              //ilk textfield

                              Container(
                                color: Colors.white,
                                width:MediaQuery.of(context).size.width*0.85,
                                margin: EdgeInsets.only(bottom:20),
                                padding: EdgeInsets.only(left: 15),
                                height:40,
                                child: TextField(
                                  controller: offerDetail,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: offerDetailHintText,
                                      hintStyle: TextStyle(
                                          color: Color(0xFFB6B7C8),
                                          fontSize: 16)),
                                ),
                              ),
                              //ikinci textfield
                              Container(
                                color: Colors.white,
                                width:MediaQuery.of(context).size.width*0.85,
                                margin: EdgeInsets.only(bottom:20),
                                padding: EdgeInsets.only(left: 15),
                                height:40,
                                child: TextField(
                                  controller: offerTag,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: offerTagHintText,
                                      hintStyle: TextStyle(
                                          color: Color(0xFFB6B7C8),
                                          fontSize: 16)),
                                ),
                              ),
                              //ikinci textfield
                              Container(
                                color: Colors.white,
                                width:MediaQuery.of(context).size.width*0.85,
                                margin: EdgeInsets.only(bottom:20),
                                padding: EdgeInsets.only(left: 15,bottom: 10,right: 15),
                                height:140,
                                child: TextField(
                                  controller: description,
                                  maxLines: 7,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: descriptionHintText,
                                      hintStyle: TextStyle(
                                          color: Color(0xFFB6B7C8),
                                          fontSize: 16)),
                                ),
                              ),
                              //üçüncü textfield
                              Container(
                                  width:MediaQuery.of(context).size.width*0.85,
                                  margin: EdgeInsets.only(bottom:20),
                                  height: 40,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        color: Colors.white,
                                        padding: EdgeInsets.only(left: 16),
                                        width:MediaQuery.of(context).size.width*0.6,
                                        child: TextField(
                                          readOnly: true,
                                          controller: myImageController,
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: picturePathHintText,
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400], fontSize: 16)),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          _getFromGallery();
                                        },
                                        child:  Container(
                                          margin: EdgeInsets.only(left: 20),
                                          height: 40,
                                          width: 80,
                                          alignment: Alignment.bottomCenter,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF1B7CA2),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Seç",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  )),
                            ],
                          ),
                        )
                    ),
                  )


                  //Alt Contanier
                ],
              )
          ),


    );
  }
} //view