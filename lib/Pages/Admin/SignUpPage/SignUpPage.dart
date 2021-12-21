import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafeapp/Pages/Admin/AdminBottomNavigationBarPage/AdminBottomNavPage.dart';

import 'package:cafeapp/Pages/ForgetPasswordPage/VerificationView.dart';
import 'package:cafeapp/Pages/Admin/LoginPage/LoginPage.dart';

import 'package:cafeapp/Pages/Admin/MainNavigationPage.dart';

class LoginState extends StatelessWidget {
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
                      height: MediaQuery.of(context).size.height / 2.1,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/background.png'),
                              fit: BoxFit.fill)),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: Container(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Hoşgeldiniz",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(1),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              padding: EdgeInsets.only(bottom: 100, left: 50),
                            ),
                          ),
                          Positioned(
                              child: Container(
                            padding: EdgeInsets.only(left: 100),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Cafe App",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 2.2),
                      height: MediaQuery.of(context).size.height / 1.80,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(247, 248, 251, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Giriş Yap",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
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
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "E-mail",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 16)),
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
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Şifre",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 16)),
                            ),
                          ),
                          Container(
                              height: 18,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            VerificationState(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Şifremi Unuttum',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color.fromRGBO(158, 158, 174, 1),
                                        fontSize: 12.06),
                                  ),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterState(),
                                ),
                              );
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                  top: 10,
                                ),
                                height: 22,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RegisterState(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Kayıt Ol',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(27, 124, 162, 1),
                                          fontSize: 16),
                                    ),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AdminMainNavigationPageState(
                                  
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.083,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(240, 118, 24, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Giriş Yap",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                       ,    GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MainNavigationPageState(
                                  
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              height:
                                  10,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(240, 118, 24, 1),
                              ),
                            
                            ),
                          ) ],
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
