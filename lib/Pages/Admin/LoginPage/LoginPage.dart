import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterState extends StatelessWidget {
  String nameSurname="";
  String phoneNumber="";
  String email="";
  String password="";

  CollectionReference users= FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(247, 248, 251, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Kayıt Ol",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 29.03,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.only(bottom: 30),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 16),
                            height: MediaQuery.of(context).size.height * 0.073,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: TextField(
                              onChanged: (value){
                                nameSurname=value;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "İsim Soyisim",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 18.75)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16, bottom: 10),
                            padding: EdgeInsets.only(left: 16),
                            height: MediaQuery.of(context).size.height * 0.073,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: TextField(
                              onChanged: (value){
                                phoneNumber=value;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Telefon Numarası",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 18.75)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16, bottom: 10),
                            padding: EdgeInsets.only(left: 16),
                            height: MediaQuery.of(context).size.height * 0.073,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: TextField(
                              onChanged: (value){
                                email=value;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "E-posta",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 18.75)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16, bottom: 10),
                            padding: EdgeInsets.only(left: 16),
                            height: MediaQuery.of(context).size.height * 0.073,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: TextField(
                              onChanged: (value){
                                password=value;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Şifre",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 18.75)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16, bottom: 10),
                            padding: EdgeInsets.only(left: 16),
                            height: MediaQuery.of(context).size.height * 0.073,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Şifre Tekrar",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 18.75)),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: <Widget>[
                                Align(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: Align(
                                      child: Text(
                                        "İşyeri sahibi misiniz?",
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 18.75,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                               Align(
                                 child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.39,
                                    height: 22,
                                    child: Align(
                                      child: FlatButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Yönetici Kayıt',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  8, 152, 231, 1),
                                              fontSize: 18.75),
                                        ),
                                      ),
                                    )),),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () async{
                              await users.add({
                                'nameSurname': nameSurname,
                                'mailAddress': email,
                                'password': password,
                                'phoneNumber': phoneNumber,
                                'userPoint': "100",
                              }).then((value) => print("user added"));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 100),
                              height: MediaQuery.of(context).size.height * 0.083,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(240, 118, 24, 1),
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
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
