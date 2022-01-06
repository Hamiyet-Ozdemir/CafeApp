// ignore_for_file: file_names
// ignore: prefer_const_literals_to_create_immutables

// ignore: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafeapp/Pages/Admin/AdminCafeRezervationDetailPage/AdminCafeRezervationDetailView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminCafesRezervationPage extends StatelessWidget {
  CollectionReference ref = FirebaseFirestore.instance.collection("cafe");
  AdminCafesRezervationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: Color.fromRGBO(247, 248, 251, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 68, left: 14),
                height: 120,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: const Text(
                  "Rezervasyonlar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 16, left: 16, right: 16, bottom: 16),
                height: 82,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  autofocus: false,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Arama',
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(stream: ref.snapshots(),builder: (BuildContext context,AsyncSnapshot asyncSnapshot) {
                 

                    if (asyncSnapshot.data == null) {
                      return Container(
          alignment: Alignment.center,
           margin: EdgeInsets.all(20),
                child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.purple),
                strokeWidth: 5,
                ),
        );
                    }
                    if (asyncSnapshot.hasError) {
                      return Center(
                        child: Text("Bir hata oluştu, tekrar deneyiniz."),
                      );
                    } else {
                      if (asyncSnapshot.hasData) {
                        return Flexible(
                            child: ListView.builder(
                                itemCount: asyncSnapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(247, 248, 251, 1),
                                    ),
                                    child: Column(children: [
                                      GestureDetector(
                                        onTap: () {
                                           Navigator.of(context, rootNavigator: true)
                          .pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>  AdminCafeRezervationDetailPage(
                                                cafeId: asyncSnapshot
                                                    .data.docs[index]
                                                    .data()['cafeId']
                                                    .toString(),cafeName: asyncSnapshot
                                                          .data.docs[index]
                                                          .data()['name']
                                                          .toString(),
                                              ),),
                              (Route<dynamic> route) => true);
                                        
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 16, right: 16, bottom: 20),
                                          padding: EdgeInsets.only(
                                              left: 14,
                                              right: 14,
                                              top: 10,
                                              bottom: 20),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: 105,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0)),
                                                      image: DecorationImage(
                                                        image: CachedNetworkImageProvider(
                                                            asyncSnapshot.data
                                                                .docs[index]
                                                                .data()[
                                                                    'pictureUrl']
                                                                .toString()),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 21,
                                                margin:
                                                    EdgeInsets.only(top: 15),
                                                padding:
                                                    EdgeInsets.only(left: 19),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      asyncSnapshot
                                                          .data.docs[index]
                                                          .data()['name']
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      "%80 Dolu",
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 22,
                                                margin: EdgeInsets.only(top: 5),
                                                padding:
                                                    EdgeInsets.only(left: 19),
                                                child: Row(
                                                  children: [
                                                    Center(
                                                      child: Image.asset(
                                                        "assets/images/discount_icon.png",
                                                        width: 20,
                                                        height: 20,
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    const Text(
                                                      "2 ile 8 arası çay %10 indirimli",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                  height: 30,
                                                  margin:
                                                      EdgeInsets.only(top: 0),
                                                  padding: EdgeInsets.only(
                                                      left: 22, right: 13),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Center(
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/star_image.png",
                                                                width: 70,
                                                                height: 70,
                                                              ),
                                                            ),
                                                            SizedBox(width: 2),
                                                            const Text(
                                                              "4.1",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          117,
                                                                          116,
                                                                          116,
                                                                          1)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  );
                                }));
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                  })
            ],
          ),
        ),
      );
}
