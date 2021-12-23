// ignore_for_file: file_names
// ignore: prefer_const_literals_to_create_immutables

// ignore: prefer_const_constructors

import 'package:cafeapp/Models/CafeModel.dart';
import 'package:cafeapp/Pages/Admin/AddCafe/AddCafeView.dart';
import 'package:cafeapp/Pages/Admin/AdminCafeDetailState/AdminCafeDetailView.dart';
import 'package:cafeapp/Pages/Admin/AdminProfilePage/AdminProfileView.dart';
import 'package:cafeapp/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminMainPage extends StatelessWidget {
  const AdminMainPage({Key key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BodyLayout(),
      ),
    );
  }
 }
class BodyLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) { 
    
   return _myListView(context);
  }
}
   List<CafeModel> model=AuthService.model;

Future<void> reflesh() async{
model=await AuthService().getDocs();
var emre;
 }
 Widget _myListView(BuildContext context)  {
   return Scaffold(
     body:model==null?Center(
          child: CircularProgressIndicator(),
        ):RefreshIndicator(onRefresh: reflesh,
     child:Column(children:[
      Container(
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
                  "Yönetici Sayfası",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                  child: Column(
                children: [
                 GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AdminProfile(
                                            
                                            ),
                                          ),
                                        );
                                      },
                                      child:  Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 62,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 9, bottom: 2, left: 16),
                          child: Text(
                            
                            AuthService.adminName,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Admin",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(182, 183, 200, 1)),
                          ),
                        )
                      ],
                    ),
                  ),
                 ), 
                 Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(top: 21),
                    height: 62,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 13, bottom: 2, left: 28),
                      child: Text(
                        "Kafeler",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                 Container(
                          color: Colors.white,
                          height: 43,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 3, left: 0),
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(right: 28,left: 31),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/add_icon.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddCafeState(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 20,
                                      child: Text(
                                        "Yeni Kafe Ekle",
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))
                              ],
                            ),
                          ),
               )],
              ))
            ],
          ),
        )
,
     Expanded(
       child:SizedBox(child:  ListView.builder(
     itemCount: model.length,
     itemBuilder: (context,index){
        return     
         Container(
                    
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(247, 248, 251, 1),
                        ),
                    child: Column(
                      children: [
                          GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AdminCafeDetailState(
                                            
                                            ),
                                          ),
                                        );
                                      },child:Container(
                          child: Column(
                            children: [ Container(
                          color: Colors.white,
                          height: 63,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 3, left: 0),
                          child: Container(
                            child: Row(
                              children: [
                                 Container(
                                  height: 28.83,
                                  width: 45,
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(right: 28,left: 31),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(model[index].pictureUrl),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                               
                                   Container(
                                      height: 20,
                                      width: 150,
                                      child: Text(
                                       model[index].name,
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                  height: 12,
                                  width: 6,
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(right: 28,left: 100),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/Shape.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                          ],
                          ),
                        )
                     ) ],
                    ),
                  );
       
        })
,)
   )]
,)
));}