import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';



class MakeRezervation extends StatefulWidget {

  @override
  State<MakeRezervation> createState() => _MakeRezervationState();
} //view

class _MakeRezervationState extends State<MakeRezervation> {

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
                      padding:EdgeInsets.fromLTRB(20,10,0,0),//dikkat
                        child: Column(
                          children: [
                            Row(


                              children:<Widget> [
                                Container(  //üst boşluk
                                  height: 80,
                                ),


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
                                ),



                                SizedBox(width: 37), //boşluk


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
                                      "Oluştur",
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
                              child:Text("Rezervasyon Oluştur",
                                style: GoogleFonts.roboto(
                                  color: Color(0xFF606060),
                                  fontSize: 15,
                                ),
                              ),
                            )


                          ],
                        ),
                    ),

                  ),
                  Container(
                    color:Color(0xFFFE5E5E5),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Container(

                          padding: EdgeInsets.only(left: 20),
                          margin: EdgeInsets.only(top: 22),

                          alignment: Alignment.centerLeft,
                          height:30,
                          child: Row(
                            children: [

                              Container(
                                height:25,
                                width: 25,


                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/user_icon.png'


                                      ),
                                      fit: BoxFit.fill,
                                    )

                                ),
                              ),


                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                color: Colors.white,
                                width:272,

                                padding: EdgeInsets.only(left: 16),
                                //height:,
                                child: TextField(
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Kaç Kişisiniz ?",
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12)),
                                ),
                              ),


                            ],
                          ),
                        ),
                         Container(

                          padding: EdgeInsets.only(left: 20),
                          margin: EdgeInsets.only(top: 22),

                          alignment: Alignment.centerLeft,
                          height:30,
                          child: Row(
                            children: [

                              Container(
                                height:25,
                                width: 25,


                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/time_icon.png'


                                      ),
                                      fit: BoxFit.fill,
                                    )

                                ),
                              ),


                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                color: Colors.white,
                                width:272,

                                padding: EdgeInsets.only(left: 16),
                                //height:,
                                child: TextField(
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Ne Zaman Geleceksiniz ?",
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12)),
                                ),
                              ),


                            ],
                          ),
                        ),
                         Container(

                          padding: EdgeInsets.only(left: 20),
                          margin: EdgeInsets.only(top: 22),

                          alignment: Alignment.centerLeft,
                          height:200,
                          child: Row(
                            children: [

                              Container(
                                height:25,
                                width: 25,


                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/message.png'


                                      ),
                                      fit: BoxFit.fill,
                                    )

                                ),
                              ),


                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                color: Colors.white,
                                width:272,
                                height: 200,

                                padding: EdgeInsets.only(left: 16),
                                //height:,
                                child: TextField(
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Eklemek İstediğiniz ?",
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12)),
                                ),
                              ),


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