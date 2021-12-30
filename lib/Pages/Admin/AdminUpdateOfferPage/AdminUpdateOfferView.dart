import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';



class AdminUpdateOffer extends StatefulWidget {
  @override
  State<AdminUpdateOffer> createState() => AdminUpdateOfferState();
} //view

class AdminUpdateOfferState extends State<AdminUpdateOffer> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body:SingleChildScrollView(

          child: Container(
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
                              Container(

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
                                    "Güncelle",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
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
                  Container(
                    color:Color(0xFFFE5E5E5),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [

                        Container(


                          margin: EdgeInsets.only(top: 5),

                          alignment: Alignment.centerLeft,
                          height:80,
                          child: Column(
                            children: [

                              Container(

                                height: 29,
                                alignment: Alignment.centerLeft,
                                padding:EdgeInsets.fromLTRB(50,0,0,0),//dikkat

                                child:Text("Kampanya Başlığı",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              Container(
                                color: Colors.white,
                                width:317,
                                padding: EdgeInsets.only(left: 15,bottom: 10),
                                height:39,
                                child: TextField(
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Kampanya 1",
                                      hintStyle: TextStyle(
                                          color: Color(0xFFB6B7C8),
                                          fontSize: 12)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //ilk textfield

                        Container(


                          alignment: Alignment.centerLeft,
                          height:80,
                          child: Column(
                            children: [

                              Container(

                                height: 29,
                                alignment: Alignment.centerLeft,
                                padding:EdgeInsets.fromLTRB(50,0,0,0),//dikkat

                                child:Text("Kampanya Detayı",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              Container(
                                color: Colors.white,
                                width:317,
                                padding: EdgeInsets.only(left: 15,bottom: 10),
                                height:39,
                                child: TextField(
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Çay Kampanyası",
                                      hintStyle: TextStyle(
                                          color: Color(0xFFB6B7C8),
                                          fontSize: 12)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //ikinci textfield
                        Container(
                          alignment: Alignment.centerLeft,
                          height:80,
                          child: Column(
                            children: [

                              Container(

                                height: 29,
                                alignment: Alignment.centerLeft,
                                padding:EdgeInsets.fromLTRB(50,0,0,0),//dikkat

                                child:Text("Etiket",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              Container(
                                color: Colors.white,
                                width:317,
                                padding: EdgeInsets.only(left: 15,bottom: 10),
                                height:39,
                                child: TextField(
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "2 ile 8 arası çay %10 indirimli",
                                      hintStyle: TextStyle(
                                          color: Color(0xFFB6B7C8),
                                          fontSize: 12)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //ikinci textfield
                        Container(
                          alignment: Alignment.centerLeft,
                          height:169,
                          child: Column(
                            children: [

                              Container(

                                height: 29,
                                alignment: Alignment.centerLeft,
                                padding:EdgeInsets.fromLTRB(50,0,0,0),//dikkat

                                child:Text("Ek Açıklama",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              Container(
                                color: Colors.white,
                                width:317,
                                padding: EdgeInsets.only(left: 15,bottom: 10),
                                height:140,
                                child: TextField(
                                  maxLines: 5,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                      hintStyle: TextStyle(
                                          color: Color(0xFFB6B7C8),
                                          fontSize: 12)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //üçüncü textfield
                        Container(


                          alignment: Alignment.centerLeft,
                          height:80,
                          child: Column(
                            children: [

                              Container(

                                height: 29,
                                alignment: Alignment.centerLeft,
                                padding:EdgeInsets.fromLTRB(50,0,0,0),//dikkat

                                child:Text("Kampanya Görseli ",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              Row(
                                children: [
                                  Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.only(left:47 ),
                                    width:207,
                                    padding: EdgeInsets.only(left: 15,bottom: 10),
                                    height:39,
                                    child: TextField(
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Kapmanya1.jpg",
                                          hintStyle: TextStyle(
                                              color: Color(0xFFB6B7C8),
                                              fontSize: 12)),
                                    ),
                                  ),
                                  Container(

                                    margin: EdgeInsets.only(left: 40),
                                    height: 32,
                                    width: 70,
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

                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  //Alt Contanier
                ],
              )
          ),

        )
    );
  }
} //view