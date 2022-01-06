import 'package:cafeapp/Models/CafeModel.dart';
import 'package:cafeapp/Pages/User/UserUpdateRezervations/UserUpdateRezervations.dart';
import 'package:cafeapp/service/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
     FirebaseAuth _auth = FirebaseAuth.instance;
       CollectionReference ref=  FirebaseFirestore.instance.collection("user").doc(_auth.currentUser.uid).
     collection("reservation");
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
                 GestureDetector(
                            onTap: ()  {
                           
                            Navigator.pop(context); } ,                       
                            child:
                Image.asset(
                  "assets/images/butonimage.png",
                  height: 28,
                  width: 28,
                ),),
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

  
if(asyncSnapshot.data==null){
  return Container(
          alignment: Alignment.center,
           margin: EdgeInsets.all(20),
                child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.purple),
                strokeWidth: 5,
                ),
        );

}
if(asyncSnapshot.hasError){
  return Center(child: Text("Bir hata oluştu, tekrar deneyiniz."),);
}
else{
  if(asyncSnapshot.hasData){
    return  Flexible(child: 
 ListView.builder(
     itemCount:asyncSnapshot.data.docs.length,
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
                                   Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 11, left: 27, bottom: 8),
                                        alignment: Alignment.centerLeft,
                                        child: Text("İsim: ${asyncSnapshot.data.docs[index].data()['cafeName']}"),
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
                                                 model[index].note,model[index].userName,model[index].cafeId),
                                          ),
                                        );
                                      },child:  Container(
                                         alignment: Alignment.centerRight,
                                         margin: EdgeInsets.only(right: 80,top:11),
                                        child:
                                      Image.asset(
                                        "assets/images/duzenle.png",
                                        height: 20,
                                        width: 20,
                                      )),), GestureDetector(
                                      onTap: (){
                                                AuthService().deleteRezervation(model[index].cafeId, 
                                               model[index].cafeRezervationId, 
                                               model[index].userRezervationId);
                                        
                                      },child:  
                                      Container(
                                         alignment: Alignment.centerRight,

                                        margin: EdgeInsets.only(right: 40,top: 11),
                                        child:
                                      Image.asset(
                                          "assets/images/butonimage.png",
                                          height: 20,
                                          width: 20,
                                          alignment: Alignment.centerRight)),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("Kişi Sayısı: ${asyncSnapshot.data.docs[index].data()['people']}"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("${asyncSnapshot.data.docs[index].data()['date']}"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27, bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Ekstra Not: ${asyncSnapshot.data.docs[index].data()['note']}"),
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
