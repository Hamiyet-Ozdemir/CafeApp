import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminCafeRezervationDetailPage extends StatelessWidget {
  final String cafeId;
  final String cafeName;
  



  AdminCafeRezervationDetailPage({Key key, @required this.cafeId,@required this.cafeName})
      : super(key: key);




  @override
  Widget build(BuildContext context) {


     CollectionReference ref =  FirebaseFirestore.instance
        .collection("cafe")
        .doc(cafeId)
        .collection("rezervasyonlar");
        
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(top: 3, left: 12, right: 12),
              height: 74,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: new Column(
                children: [
                  Container(
                    height: 30,
                    alignment: Alignment.bottomCenter,
                    child: Stack(children: [
                      GestureDetector(
                        onTap: () {
                                                  Navigator.pop(context);
                                                },
                        child:
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(bottom: 0),
                        child: Image.asset(
                          "assets/images/butonimage.png",
                          height: 28,
                          width: 28,
                        ),
                      ),),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only( bottom: 9),
                        child: Text(cafeName,
                            style: GoogleFonts.roboto(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ]),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 15),
                    child: Text('Rezervasyonlar',
                        style: GoogleFonts.roboto(
                          fontSize: 17,
                        )),
                  )
                ],
              ),
            ),
                            StreamBuilder<QuerySnapshot>(stream: ref.snapshots(),builder: (BuildContext context,AsyncSnapshot asyncSnapshot){

  
if(asyncSnapshot.data==null){
  return CircularProgressIndicator();

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
                                        child: Text("İsim: ${asyncSnapshot.data.docs[index].data()['name']}"),
                                      ),
                         
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
