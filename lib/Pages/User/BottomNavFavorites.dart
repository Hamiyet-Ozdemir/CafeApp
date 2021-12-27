// ignore_for_file: file_names, prefer_const_constructors

import 'package:cafeapp/Pages/User/UserCafeDetailPage/UserCafeDetailView.dart';
import 'package:flutter/material.dart';

import 'UserMakeRezervationPage/UserMakeRezervationView.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key key}) : super(key: key);

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
                  "Favoriler",
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
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserCafeDetailState(),
                        ),
                      );
                    }, child:  Container(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 105,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/cafe_2.png"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 20,
                                child: Image.asset(
                                  "assets/images/favorited_icon.png",
                                  width: 40,
                                  height: 40,
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 21,
                            margin: EdgeInsets.only(top: 15),
                            padding: EdgeInsets.only(left: 19),
                            child: Row(
                              children: const [
                                Text(
                                  "Starbucks Coffe",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
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
                            height: 52,
                            margin: EdgeInsets.only(top: 0),
                            padding: EdgeInsets.only(left: 19),
                            child: Row(
                              children: [
                                Positioned(
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserMakeRezervation("",""),
                        ),
                      );
                    },
                    child:   Container(
                              alignment: Alignment.center,
                              width: 120,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFF07618),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Text(
                                "Rezervasyon Yap",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),)
                          )
                        ],
                      )),
                  ),Container(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 105,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/cafe_2.png"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 20,
                                child: Image.asset(
                                  "assets/images/favorited_icon.png",
                                  width: 40,
                                  height: 40,
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 21,
                            margin: EdgeInsets.only(top: 15),
                            padding: EdgeInsets.only(left: 19),
                            child: Row(
                              children: const [
                                Text(
                                  "Starbucks Coffe",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
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
                            height: 52,
                            margin: EdgeInsets.only(top: 0),
                            padding: EdgeInsets.only(left: 19),
                            child: Row(
                              children: [
                                Positioned(
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              alignment: Alignment.center,
                              width: 120,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFF07618),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Text(
                                "Rezervasyon Yap",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 105,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/cafe_2.png"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 20,
                                child: Image.asset(
                                  "assets/images/favorited_icon.png",
                                  width: 40,
                                  height: 40,
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 21,
                            margin: EdgeInsets.only(top: 15),
                            padding: EdgeInsets.only(left: 19),
                            child: Row(
                              children: const [
                                Text(
                                  "Starbucks Coffe",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
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
                            height: 52,
                            margin: EdgeInsets.only(top: 0),
                            padding: EdgeInsets.only(left: 19),
                            child: Row(
                              children: [
                                Positioned(
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              alignment: Alignment.center,
                              width: 120,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFF07618),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Text(
                                "Rezervasyon Yap",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 105,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/cafe_2.png"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 20,
                                child: Image.asset(
                                  "assets/images/favorited_icon.png",
                                  width: 40,
                                  height: 40,
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 21,
                            margin: EdgeInsets.only(top: 15),
                            padding: EdgeInsets.only(left: 19),
                            child: Row(
                              children: const [
                                Text(
                                  "Starbucks Coffe",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
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
                            height: 52,
                            margin: EdgeInsets.only(top: 0),
                            padding: EdgeInsets.only(left: 19),
                            child: Row(
                              children: [
                                Positioned(
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              alignment: Alignment.center,
                              width: 120,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFF07618),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Text(
                                "Rezervasyon Yap",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 105,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/cafe_2.png"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 20,
                                child: Image.asset(
                                  "assets/images/favorited_icon.png",
                                  width: 40,
                                  height: 40,
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 21,
                            margin: EdgeInsets.only(top: 15),
                            padding: EdgeInsets.only(left: 19),
                            child: Row(
                              children: const [
                                Text(
                                  "Starbucks Coffe",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
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
                            height: 52,
                            margin: EdgeInsets.only(top: 0),
                            padding: EdgeInsets.only(left: 19),
                            child: Row(
                              children: [
                                Positioned(
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              alignment: Alignment.center,
                              width: 120,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFF07618),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Text(
                                "Rezervasyon Yap",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              )))
            ],
          ),
        ),
      );
}
