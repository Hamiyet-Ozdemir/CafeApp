import 'package:cafeapp/Pages/Admin/AdminSignUpPage/AdminSignUpView.dart';
import 'package:cafeapp/Pages/User/UserLoginPage/UserLoginView.dart';
import 'package:cafeapp/service/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserRegisterState extends StatelessWidget {
  AuthService _authService = AuthService();
  TextEditingController _nameSurname = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();

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
                                  fontSize: 25,
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
                              controller: _nameSurname,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "İsim Soyisim",
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
                              controller: _phoneNumber,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Telefon Numarası",
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
                              controller: _email,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "E-posta",
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
                              controller: _password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Şifre",
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
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Şifre Tekrar",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 16)),
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
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AdminSignUpState(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        height: 22,
                                        child: Align(
                                          child: FlatButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AdminSignUpState(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Yönetici Kayıt',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      8, 152, 231, 1),
                                                  fontSize: 14),
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _authService
                                  .createUser(_nameSurname.text, _email.text,
                                      _password.text, _phoneNumber.text)
                                  .then((value) {
                                return Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginState()));
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 100),
                              height:
                                  MediaQuery.of(context).size.height * 0.083,
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
