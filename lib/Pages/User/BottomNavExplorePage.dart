import 'package:cafeapp/CustomWidgets/DashboardCafeWidget.dart';
import 'package:cafeapp/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({Key key}) : super(key: key);
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
                  "Keşfet",
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
                      itemCount: AuthService.model.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return CafeCardWidget(
                          postId: index,
                        );
                      })),
            ],
          ),
        ),
      );
}
