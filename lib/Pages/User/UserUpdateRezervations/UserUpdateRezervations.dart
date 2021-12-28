import 'package:cafeapp/service/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';




class UserUpdateRezervation extends StatefulWidget {
  final String cafeRezervationId;
  final String userRezervationId;
  final String people;
  final String date;
  final String note;
  final String name;




  UserUpdateRezervation(String cafeRezervationId,
  String userRezervationId,String people,String date,String note,String name) : 
  this.cafeRezervationId = cafeRezervationId,this.userRezervationId=userRezervationId,this.name=name
  ,this.date=date,this.note=note,this.people=people;

  @override
  State<UserUpdateRezervation> createState() => _UserUpdateRezervationState(cafeRezervationId,userRezervationId
  ,date,note,people,name);
} //view

class _UserUpdateRezervationState extends State<UserUpdateRezervation> {
  _UserUpdateRezervationState(this.cafeRezervationId,this.userRezervationId,
  this.date,this.note,this.people,this.name);

  final String cafeRezervationId;
  final String userRezervationId;
  final String date;
  final String note;
  final String people;
  final String name;



 Future<TimeOfDay> saatSec(BuildContext context) {
    return showTimePicker(
            context: context, initialTime: TimeOfDay.now());
  }

  Future<DateTime> tarihSec(BuildContext context) {
    return showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: DateTime.now(),
        lastDate: DateTime(2023),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark(),
            child: child,
          );
        },
      );
  }
  TextEditingController textcontoller=TextEditingController();
  TextEditingController noteContoller=TextEditingController();
  TextEditingController peopleContoller=TextEditingController();


 DateTime secilenTarih = DateTime.now();
  TimeOfDay secilenSaat = TimeOfDay.fromDateTime(DateTime.now());
  @override
  Widget build(BuildContext context) {
    String date1=date;
textcontoller.text=date;
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


                                Text(name,


                                    style: GoogleFonts.roboto(

                                      fontStyle: FontStyle.normal,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )
                                ),
                            GestureDetector(
                              onTap: () {
                                              AuthService().updateRezervation(peopleContoller.text,
                                               cafeRezervationId, noteContoller.text,
                                                "Saat : ${secilenSaat.hour.toString()} : ${secilenSaat.
                              minute.toString()}   Tarih : ${secilenTarih.day}-${secilenTarih.month}-${secilenTarih.year}",
                              cafeRezervationId,userRezervationId);                
                                                            },child:     Container(

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
                      
                            )        ],
                            ) ,
                            Container(
                              margin: EdgeInsets.fromLTRB(4, 0,40, 0),
                              child:Text("Rezervasyon Güncelle",
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
                                  controller: peopleContoller,
                                   textAlign: TextAlign.left,
                                   
                                  decoration: InputDecoration(
                                      
                                      border: InputBorder.none,
                                      hintText: people,
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12)),
                                ),
                              ),


                            ],
                          ),
                        ),
                        GestureDetector(onTap: () async {
                           secilenTarih =  await tarihSec(context);
       
       
        if(secilenTarih != null){
          secilenSaat = await saatSec(context);
        }
        
        if(secilenTarih != null && secilenSaat != null){
           
         textcontoller.text="Saat : ${secilenSaat.hour.toString()} : ${secilenSaat.
                              minute.toString()}   Tarih : ${secilenTarih.day}-${secilenTarih.month}-${secilenTarih.year}";
        }
       
                                                  
                                                },child:   Container(

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
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  child: TextField(controller: textcontoller,)
 ,
                                )

                               ) ],
                          ),
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
                                  controller: noteContoller,

                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: note,
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