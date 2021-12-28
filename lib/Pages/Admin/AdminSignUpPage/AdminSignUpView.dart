import 'package:cafeapp/Pages/User/UserLoginPage/UserLoginView.dart';
import 'package:cafeapp/service/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminSignUp extends StatefulWidget{

  @override
  State<AdminSignUp> createState()=> AdminSignUpState();
}

class AdminSignUpState extends State<AdminSignUp> {
  final TextEditingController nameSurname = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordAgain = TextEditingController();

  final AuthService _authService=AuthService();

  double opacity=0.4;


  bool isNull(){
    if(nameSurname.text.isNotEmpty && nameSurname.text!="İsim Soyisim" && email.text.isNotEmpty&&
        email.text!="E-posta" && password.text.isNotEmpty && password.text!= "Şifre" &&
        phoneNumber.text.isNotEmpty && phoneNumber.text!="Telefon Numarası" && passwordAgain.text.isNotEmpty &&
        passwordAgain.text!="Şifre (Tekrar)"){
      opacity=1;

      return true;
    }else{
      opacity=0.4;
      return false;
    }

  }
  @override
  void initState() {

    nameSurname.addListener(() {
      setState(() {});
    });
    email.addListener(() {
      setState(() {});
    });
    phoneNumber.addListener(() {
      setState(() {});
    });
    password.addListener(() {
      setState(() {});
    });
    passwordAgain.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    nameSurname.dispose();
    phoneNumber.dispose();
    email.dispose();
    password.dispose();
    passwordAgain.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFECEEF5),
        body:SingleChildScrollView(
          child:Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 38),
                  padding: EdgeInsets.only(top:38),
                  alignment:Alignment.topCenter,
                  child:Text(
                      'Yönetici Kayıt',
                      style: GoogleFonts.roboto(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 37, bottom: 5),
                  padding: EdgeInsets.only(left: 16),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(12))),
                  child: TextField(
                    onChanged: (text){
                      isNull();
                    },
                  controller: nameSurname,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "İsim Soyisim",
                        hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 18.75)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  padding: EdgeInsets.only(left: 16),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(12))),
                  child: TextField(
                    onChanged: (text){
                      isNull();
                    },
                    controller: phoneNumber,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Telefon Numarası",
                        hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 18.75)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  padding: EdgeInsets.only(left: 16),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(12))),
                  child: TextField(
                    onChanged: (text){
                      isNull();
                    },
                    controller: email,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "E-posta",
                        hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 18.75)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  padding: EdgeInsets.only(left: 16),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(12))),
                  child: TextField(
                    onChanged: (text){
                      isNull();
                    },
                    controller: password,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Şifre",
                        hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 18.75)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  padding: EdgeInsets.only(left: 16),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(12))),
                  child: TextField(
                    onChanged: (text){
                      isNull();
                    },
                    controller: passwordAgain,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Şifre (Tekrar)",
                        hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 18.75)),
                  ),
                ),

                 GestureDetector(
                   //check passwords
                   onTap: (){
                     if(isNull()){
                       showDialog<String>(
                           context: context,
                           builder: (BuildContext context) =>  AlertDialog(
                             title: Text("Lütfen boş alanları Doldurunuz!"),
                             actions:<Widget>[
                               TextButton(
                                 onPressed: () => Navigator.pop(context),
                                 child: const Text('OK'),
                               ),
                             ],

                           ));

                       if(password.text==passwordAgain.text){
                         _authService.createAdmin(nameSurname.text,email.text,password.text,phoneNumber.text).then((value)
                         {
                           return Navigator.push(context,MaterialPageRoute(builder: (context) => LoginState()));
                         });
                       }
                       else{
                         showDialog<String>(
                             context: context,
                             builder: (BuildContext context) =>  AlertDialog(
                               title: Text("Şifreler uyuşmuyor!"),
                               actions:<Widget>[
                                 TextButton(
                                   onPressed: () => Navigator.pop(context),
                                   child: const Text('OK'),
                                 ),
                               ],

                             ));
                       }
                     }else{
                       opacity=0.4;
                     }

                   },
                            child: 
                     Container(
                       margin: EdgeInsets.only(top: 50),
                       height: 60,
                       width: MediaQuery.of(context).size.width * 0.9,
                       alignment: Alignment.bottomCenter,
                       decoration: BoxDecoration(
                         color: Color.fromRGBO(240, 118, 24, opacity),
                         borderRadius: BorderRadius.circular(10),
                       ),
                       child: Center(
                         child: Text(
                           "Kayıt Ol",
                           style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.bold),
                         ),
                       ),
                   ),
                 ),
              ],
            ),
          ),
        )
    );
  }
}