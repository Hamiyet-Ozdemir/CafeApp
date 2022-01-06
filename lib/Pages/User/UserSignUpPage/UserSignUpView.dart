import 'package:cafeapp/Pages/Admin/AdminSignUpPage/AdminSignUpView.dart';
import 'package:cafeapp/Pages/User/UserLoginPage/UserLoginView.dart';
import 'package:cafeapp/service/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class UserSignUp extends StatefulWidget{
  @override
  State<UserSignUp> createState()=> UserSignUpState();
}

class UserSignUpState extends  State<UserSignUp> {
  //firebase implementation data
  final AuthService _authService=AuthService();
  final TextEditingController nameSurname=TextEditingController();
  final TextEditingController password=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController phoneNumber=TextEditingController();
  final TextEditingController passwordAgain=TextEditingController();
  double opacity=0.4;


  bool isNull(){
    if(nameSurname.text.isNotEmpty && nameSurname.text!="İsim Soyisim" && email.text.isNotEmpty&&
        email.text!="E-posta" && password.text.isNotEmpty && password.text!= "Şifre" &&
        phoneNumber.text.isNotEmpty && phoneNumber.text!="Telefon Numarası" && passwordAgain.text.isNotEmpty &&
        passwordAgain.text!="Şifre (Tekrar)"){
      opacity=1;

      return true;
    }else{
      opacity=0.4;
      return false;
    }

  }
  @override
  void initState() {

    nameSurname.addListener(() {
      setState(() {});
    });
    email.addListener(() {
      setState(() {});
    });
    phoneNumber.addListener(() {
      setState(() {});
    });
    password.addListener(() {
      setState(() {});
    });
    passwordAgain.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    nameSurname.dispose();
    phoneNumber.dispose();
    email.dispose();
    password.dispose();
    passwordAgain.dispose();
    super.dispose();
  }


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
                              onChanged: (text){
                                isNull();
                              },
                              controller: nameSurname,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "İsim Soyisim",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 16)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            padding: EdgeInsets.only(left: 16),
                            height: MediaQuery.of(context).size.height * 0.073,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: TextField(
                              onChanged: (text){
                                isNull();
                              },
                              controller: phoneNumber,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Telefon Numarası",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 16)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            padding: EdgeInsets.only(left: 16),
                            height: MediaQuery.of(context).size.height * 0.073,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: TextField(
                              onChanged: (text){
                                isNull();
                              },
                              controller: email,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "E-posta",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 16)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            padding: EdgeInsets.only(left: 16),
                            height: MediaQuery.of(context).size.height * 0.073,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: TextField(
                              onChanged: (text){
                                isNull();
                              },
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Şifre",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 16)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16,bottom: 10),
                            padding: EdgeInsets.only(left: 16),
                            height: MediaQuery.of(context).size.height * 0.073,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: TextField(
                              onChanged: (text){
                                isNull();
                              },
                              controller: passwordAgain,
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
                                              AdminSignUp(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        height: 22,
                                        child: Align(
                                          child: FlatButton(
                                            onPressed: () {
                                             Navigator.of(context, rootNavigator: true)
                          .pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>   AdminSignUp()),
                              (Route<dynamic> route) => true);
                                            },
                                            child: Text(
                                              'Yönetici Kayıt',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      8, 152, 231, opacity),
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
                            //check passwords
                            onTap: (){
                              if(isNull()){
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>  AlertDialog(
                                      title: Text("Lütfen boş alanları Doldurunuz!"),
                                      actions:<Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: const Text('OK'),
                                        ),
                                      ],

                                    ));

                                if(password.text==passwordAgain.text){
                                  _authService.createUser(nameSurname.text,email.text,password.text,phoneNumber.text).then((value)
                                  {
                                    return Navigator.push(context,MaterialPageRoute(builder: (context) => LoginState()));
                                  });
                                }
                                else{
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>  AlertDialog(
                                        title: Text("Şifreler uyuşmuyor!"),
                                        actions:<Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: const Text('OK'),
                                          ),
                                        ],

                                      ));
                                }
                              }else{
                                opacity=0.4;
                              }

                            },
                            child:
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.9,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(240, 118, 24, opacity),
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
                          ),
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
