// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:cafeapp/Pages/Admin/AdminCafesRezervationPage/AdminCafesRezervationView.dart';
import 'package:flutter/material.dart';
import 'package:cafeapp/Pages/Admin/AdminMainPage/AdminMainPageView.dart';


class AdminMainNavigationPageState extends StatefulWidget {


  @override
  State<AdminMainNavigationPageState> createState() =>
      _AdminMainNavigationPageState();
}

class _AdminMainNavigationPageState
    extends State<AdminMainNavigationPageState> {
  int currentIndex = 0;
  final screens = [
    const AdminMainPage(),
    const AdminCafesRezervationPage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(236, 238, 245, 1),
          selectedItemColor: Colors.black,
          unselectedItemColor: Color.fromRGBO(182, 183, 200, 1),
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Yönetim",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Rezervasyonlar",
            ),
          ],
        ),
      );
}
