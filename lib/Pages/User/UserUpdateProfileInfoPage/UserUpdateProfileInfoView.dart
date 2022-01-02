import 'package:cafeapp/service/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserUpdateProfileInfo extends StatefulWidget {
  @override
  State<UserUpdateProfileInfo> createState() => _UserUpdateProfileInfo();
} //view
 TextEditingController nameController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
class _UserUpdateProfileInfo extends State<UserUpdateProfileInfo> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                //üst boşluk
                height: 110,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 25,
                  width: 25,
                  margin: EdgeInsets.only(left: 15, top: 50),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/butonimage.png'),
                    fit: BoxFit.fill,
                  )),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 50),
                child: Text(AuthService.userName,
                    style: GoogleFonts.roboto(
                      fontStyle: FontStyle.normal,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF07618),
                    )),
              ),
            ],
          ),
          Container(
            color: Color(0xFFFE5E5E5),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(top: 22),
                  alignment: Alignment.centerLeft,
                  height: 39,
                  child: Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/user_icon.png'),
                          fit: BoxFit.fill,
                        )),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        color: Colors.white,

                        width: 272,
                        padding: EdgeInsets.only(left: 16),
                        //height:,
                        child: TextField(
                          controller: nameController,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "İsim - Soyisim",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 80), //
                  margin: EdgeInsets.only(top: 20),

                  alignment: Alignment.centerLeft,
                  height: 39,
                  child: Container(
                    color: Colors.white,

                    width: 272,
                    padding: EdgeInsets.only(left: 16),
                    //height:,
                    child: TextField(
                      controller: phoneNumberController,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Telefon Numarası",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 12)),
                    ),
                  ),
                ),
                GestureDetector(
                  
                  onTap: () async {
                    await FirebaseFirestore.instance
                        .collection("user")
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .update({
                          'nameSurname':nameController.text,
                          'phoneNumber':phoneNumberController.text,
                        }).whenComplete(() =>  Navigator.pop(context));
                       
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 29),
                    height: 32,
                    width: 170,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Color(0xFF1B7CA2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Bilgileri Güncelle",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          //Alt Contanier
        ],
      )),
    ));
  }
} //view