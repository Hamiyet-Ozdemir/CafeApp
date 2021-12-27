// ignore_for_file: file_names, prefer_const_constructors

import 'package:cafeapp/CustomWidgets/DashboardCafeWidget.dart';
import 'package:cafeapp/Pages/User/UserCafeDetailPage/UserCafeDetailView.dart';
import 'package:cafeapp/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:cafeapp/Models/CafeModel.dart';
import 'UserMakeRezervationPage/UserMakeRezervationView.dart';

class FavoritesPage extends StatefulWidget {
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Future<void> getFav() async {
    await AuthService().getFavoriteCafes();
  }

  @override
  Widget build(BuildContext context) {
    getFav();
    print("***************");
    print(AuthService.ModelFavCafe[0]);

    return Scaffold(
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
                child: ListView.builder(
                    itemCount: AuthService.ModelFavCafe.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return CafeCardWidget(
                        index: index,
                        cafeModel: AuthService.ModelFavCafe,
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
