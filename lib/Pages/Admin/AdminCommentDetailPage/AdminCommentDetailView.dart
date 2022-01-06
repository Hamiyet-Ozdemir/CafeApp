import 'package:cafeapp/service/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminCommentDetail extends StatefulWidget {
  final String cafeId;
  final String commentId;
  final String cafeName;

  AdminCommentDetail(String cafeId, String commentId,String cafeName)
      : this.cafeId = cafeId,
        this.commentId = commentId,
        this.cafeName=cafeName;
  @override
  _AdminCommentDetailState createState() =>
      _AdminCommentDetailState(cafeId, commentId,cafeName);
}

class _AdminCommentDetailState extends State<AdminCommentDetail> {
  _AdminCommentDetailState(this.cafeId, this.commentId,this.cafeName);
  final String cafeId;
  final String commentId;
  final String cafeName;

  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference cafesRef = FirebaseFirestore.instance
        .collection("cafe")
        .doc(cafeId)
        .collection("yorumlar");
String name;
if (AuthService.adminName==null) {
  name=AuthService.userName;
} else {
  name=AuthService.adminName;
}
    var commentRef = cafesRef.doc(commentId);
    
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFFFFFFF),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 47),
              padding: EdgeInsets.only(top: 3, left: 12, right: 12),
              height: 50,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/images/butonimage.png",
                        height: 28,
                        width: 28,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 56),
                      height: 28,
                      child: Text(cafeName,
                          style: GoogleFonts.roboto(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    GestureDetector(
                        onTap: () async {
                           AuthService().commentToComment(
                            
                              name,
                              DateTime.now().toString(),
                              commentController.text,
                              0,
                              0,
                              commentId);
                        
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 27),
                          height: 28,
                          width: 72,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            color: Color(0xFF1B7CA2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Yayınla",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ))
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //comment
                      StreamBuilder<DocumentSnapshot>(
                          stream: commentRef.snapshots(),
                          builder: (context, AsyncSnapshot asyncSnapshot) {
                            if (asyncSnapshot.hasData) {
                              return Container(
                                  margin: EdgeInsets.only(top: 9),
                                  width:
                                      MediaQuery.of(context).size.width * 0.93,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5))),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.93,
                                        margin: EdgeInsets.only(
                                            left: 15, top: 18, bottom: 8),
                                        child: new Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/Star.png",
                                              height: 15,
                                              width: 15,
                                            ),
                                            Image.asset(
                                              "assets/images/Star.png",
                                              height: 15,
                                              width: 15,
                                            ),
                                            Image.asset(
                                              "assets/images/Star.png",
                                              height: 15,
                                              width: 15,
                                            ),
                                            Image.asset(
                                              "assets/images/Star.png",
                                              height: 15,
                                              width: 15,
                                            ),
                                            Image.asset(
                                              "assets/images/Star_Empty.png",
                                              height: 15,
                                              width: 15,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 4),
                                              height: 15,
                                              child: Text('4.1',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.93,
                                        margin: EdgeInsets.only(
                                            left: 15, bottom: 8),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Text(
                                                asyncSnapshot.data
                                                    .data()["username"],
                                                style: GoogleFonts.roboto(
                                                  color: Color(0xFFF07618),
                                                  fontSize: 13,
                                                  //figma 12 yazıyodu kodda güncelledim fontsize ı
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 12),
                                              child: Text(
                                                asyncSnapshot.data
                                                    .data()["date"]
                                                    .toString()
                                                    .split(".")
                                                    .first,
                                                style: GoogleFonts.roboto(
                                                  color: Color(0xFF7C7C7C),
                                                  fontSize: 13,
                                                  //figma 12 yazıyodu kodda güncelledim fontsize ı
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            asyncSnapshot.data
                                                .data()["comment"],
                                            style: GoogleFonts.roboto(
                                              color: Color(0xFF000000),
                                              fontSize: 13,
                                              //figma 12 yazıyodu burada da güncelledim fontsize ı
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        height: 26,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.only(bottom: 6),
                                        padding: EdgeInsets.only(
                                            left: 270, right: 23),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              asyncSnapshot.data
                                                  .data()["like"]
                                                  .toString(),
                                              style: GoogleFonts.roboto(
                                                color: Color(0xFF000000),
                                                fontSize: 17,
                                              ),
                                            ),
                                            SizedBox(width: 3),
                                            Image.asset(
                                              "assets/images/like.png",
                                              height: 15,
                                              width: 15,
                                            ),
                                            SizedBox(width: 15),
                                            Text(
                                              asyncSnapshot.data
                                                  .data()["unlike"]
                                                  .toString(),
                                              style: GoogleFonts.roboto(
                                                color: Color(0xFF000000),
                                                fontSize: 17,
                                              ),
                                            ),
                                            SizedBox(width: 3),
                                            Image.asset(
                                              "assets/images/unlike.png",
                                              height: 15,
                                              width: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 15, right: 98),
                                        padding: EdgeInsets.only(left: 4),
                                        child: TextField(
                                          controller: commentController,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                              hintText: "Yanıtla..",
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFFE3E0E0),
                                                              width: 0)),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontSize: 13)),
                                        ),
                                      ),
                                    ],
                                  ));
                            } else {
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
                          }),
                      //answer
                               StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance.collection("commenttocomment").where("commentId",isEqualTo: commentId)
                    .snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot asyncSnapshot1) {
                                          if (asyncSnapshot1.data == null) {
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
                                          if (asyncSnapshot1.hasError) {
                                            return Center(
                                              child: Text(
                                                  "Bir hata oluştu, tekrar deneyiniz."),
                                            );
                                          } else {
                                            if (asyncSnapshot1.hasData) {
                                              return 
                                              SizedBox(
                                                       width: MediaQuery.of(context).size.width * 0.93,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height -
                                                              320,
                                                      child:
                                                          new ListView.builder(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            asyncSnapshot1.data
                                                                .docs.length,
                                                        itemBuilder:
                                                            (BuildContext ctxt,
                                                                int index) {
                                                          return 
                                                         Container(

                          padding: EdgeInsets.only(left: 41),

                          width: MediaQuery.of(context).size.width * 0.93,
                          decoration: BoxDecoration(
                              color: Color(0xFFF8F8F8),
                             
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5))
                          ),
                          child:Column(
                            children: [

                              Container(
                                alignment: Alignment.topLeft,
                                height: 15,
                                width: MediaQuery.of(context).size.width * 0.93,
                                margin: EdgeInsets.only(left: 15,bottom: 8,top: 23),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        asyncSnapshot1.data.docs[index]["username"],
                                        style: GoogleFonts.roboto(
                                          color: Color(0xFFF07618),
                                          fontSize: 13,
                                          //figma 12 yazıyodu kodda güncelledim fontsize ı
                                        ),

                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 12),
                                      child: Text(
                                        asyncSnapshot1.data.docs[index]["date"].toString().split(".").first,
                                        style: GoogleFonts.roboto(
                                          color: Color(0xFF7C7C7C),
                                          fontSize: 14,
                                          //figma 12 yazıyodu kodda güncelledim fontsize ı
                                        ),

                                      ),
                                    ),
                                  ],
                                ),

                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15,right: 15),
                                child:Align(
                                  alignment: Alignment.centerLeft,
                                child: Text(
                                  asyncSnapshot1.data.docs[index]["comment"],
                                  style: GoogleFonts.roboto(
                                    color: Color(0xFF000000),
                                    fontSize: 14,
                                    //figma 12 yazıyodu burada da güncelledim fontsize ı
                                  ),

                                ),),
                              ),
                              Container(

                                alignment: Alignment.centerRight,
                                height: 26,
                                width: MediaQuery.of(context).size.width ,
                                margin: EdgeInsets.only(bottom: 6),
                                padding: EdgeInsets.only(left: 100,right:23),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      asyncSnapshot1.data.docs[index]["like"].toString(),
                                      style: GoogleFonts.roboto(
                                        color: Color(0xFF000000),
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                     Image.asset(
                      "assets/images/like.png",
                      height: 15,
                      width: 15,
                    ),
                                    SizedBox(width: 15),
                                    Text(
                                     asyncSnapshot1.data.docs[index]["unlike"].toString(),
                                      style: GoogleFonts.roboto(
                                        color: Color(0xFF000000),
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                     Image.asset(
                      "assets/images/unlike.png",
                      height: 15,
                      width: 15,
                    ),

                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15,right: 98),
                                padding: EdgeInsets.only(left: 4),
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      hintText: "Yanıtla..",
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide: const BorderSide(color: Color(0xFFE3E0E0),width: 0)
                                      ),
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 13)),
                                ),
                              ),

                            ],
                          )
                      );
      },
                                                      ));
                                 } else {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          }
                                        })
                      
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
