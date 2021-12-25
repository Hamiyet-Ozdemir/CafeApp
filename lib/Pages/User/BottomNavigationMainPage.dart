// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'BottomNavExplorePage.dart';
import 'BottomNavFavorites.dart';
import 'BottomNavProfile.dart';

class MainNavigationPageState extends StatefulWidget {
  @override
  State<MainNavigationPageState> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPageState> {
  int currentIndex = 0;
  final screens = [
    ExplorePage(),
    FavoritesPage(),
    ProfilePage(),
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
              label: "Keşfet",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favoriler",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profil",
            ),
          ],
        ),
      );
}



// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:hello_world/Views/MainNavigation/ExplorePage.dart';
// import 'package:hello_world/Views/MainNavigation/FavoritesPage.dart';
// import 'package:hello_world/Views/MainNavigation/ProfilePage.dart';

// import 'Views/Register/LoginPage/LoginPage.dart';

// void main() {
//   runApp(RegisterState());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int currentIndex = 0;
//   final screens = [
//     ExplorePage(),
//     FavoritesPage(),
//     ProfilePage(),
//   ];

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: screens[currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Color.fromRGBO(236, 238, 245, 1),
//           selectedItemColor: Colors.black,
//           unselectedItemColor: Color.fromRGBO(182, 183, 200, 1),
//           currentIndex: currentIndex,
//           onTap: (index) => setState(() => currentIndex = index),
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.explore),
//               label: "Keşfet",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite),
//               label: "Favoriler",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: "Profil",
//             ),
//           ],
//         ),
//       );
// }
