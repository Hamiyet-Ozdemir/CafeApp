import 'package:cafeapp/Models/CafeModel.dart';
import 'package:cafeapp/Pages/User/UserMakeRezervationPage/UserMakeRezervationView.dart';
import 'package:cafeapp/Pages/User/UserUpdateRezervations/UserUpdateRezervations.dart';
import 'package:cafeapp/service/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> click()async{
model=await AuthService().getRezervationByUser();
}
  List<RezervationModel> model;

class UserRezervationsState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     CollectionReference ref=  FirebaseFirestore.instance.collection("user")
    .doc("8lUaVak3E0QoWhv761INrKyxE7h2").
     collection("rezervation");
  click();
     

    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 47),
              padding: EdgeInsets.only(top: 3, left: 12, right: 12),
              height: 118,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: new Row(children: [
                Image.asset(
                  "assets/images/butonimage.png",
                  height: 28,
                  width: 28,
                ),
                Container(
                  margin: EdgeInsets.only(left: 58),
                  child: Text('Rezervasyonlar',
                      style: GoogleFonts.roboto(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ]),
            ),
            
                    StreamBuilder<QuerySnapshot>(stream: ref.snapshots(),builder: (BuildContext context,AsyncSnapshot asyncSnapshot){

  
if(model==null){
  return CircularProgressIndicator();

}
if(asyncSnapshot.hasError){
  return Center(child: Text("Bir hata oluştu, tekrar deneyiniz."),);
}
else{
  if(model!=null){
    return  Flexible(child: 
 ListView.builder(
     itemCount:model.length,
     itemBuilder: (context,index){
        return   Container(
                        margin: EdgeInsets.only(bottom: 8),
                        color: Color.fromRGBO(244, 245, 248, 1),
                        height: 121,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,

                                  child:
                                   Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 11, left: 27, bottom: 8),
                                        alignment: Alignment.centerLeft,
                                        child: Text("İsim: ${model[index].cafeName}"),
                                      ),
                                      GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                               UserUpdateRezervation(model[index].cafeRezervationId, 
                                               model[index].userRezervationId,
                                                model[index].people, model[index].date,
                                                 model[index].note,model[index].userName),
                                          ),
                                        );
                                      },child:  Container(
                                         margin: EdgeInsets.only(
                                           left: 180),
                                        child:
                                      Image.asset(
                                        "assets/images/duzenle.png",
                                        height: 20,
                                        width: 20,
                                      )),),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child:
                                      Image.asset(
                                          "assets/images/butonimage.png",
                                          height: 20,
                                          width: 20,
                                          alignment: Alignment.centerRight)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Kişi Sayısı: ${model[index].people}"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("${model[index].date}"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Ekstra Not: ${model[index].note}"),
                            ),
                          ],
                        ),
                      );
                    
         
        })
);

  }
  else{
    return Center(child: CircularProgressIndicator(),);
  }
  
}
})
    
                   
          ],
        ));
  }
}
