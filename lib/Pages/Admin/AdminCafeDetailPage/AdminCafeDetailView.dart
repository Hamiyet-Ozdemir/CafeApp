import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafeapp/Models/OfferModel.dart';
import 'package:cafeapp/Pages/Admin/AdminAddMenuPage/AdminAddMenuView.dart';
import 'package:cafeapp/Pages/Admin/AdminAddOfferPage/AdminAddOfferView.dart';
import 'package:cafeapp/Pages/Admin/AdminCommentDetailPage/AdminCommentDetailView.dart';
import 'package:cafeapp/Pages/Admin/AdminUpdateOfferPage/AdminUpdateOfferView.dart';
import 'package:cafeapp/service/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminCafeDetail extends StatefulWidget {
  final String cafeId;
  AdminCafeDetail({String cafeId}) : this.cafeId = cafeId;

  @override
  _AdminCafeDetailState createState() => _AdminCafeDetailState(cafeId);
}

class _AdminCafeDetailState extends State<AdminCafeDetail> {
  _AdminCafeDetailState(this.cafeId);

  //cafe id çek burada
  final String cafeId;

  @override
  Widget build(BuildContext context) {
    CollectionReference cafesRef =
        FirebaseFirestore.instance.collection("cafe");
    var cafeRef = cafesRef.doc(cafeId);
    CollectionReference ref=FirebaseFirestore.instance.collection("cafe").doc(cafeId).collection("kampanyalar");


    return DefaultTabController(
      length: 3,
      child:  StreamBuilder<DocumentSnapshot>(
                      stream: cafeRef.snapshots(),
                      builder: (context, AsyncSnapshot asyncSnapshot) {
                     if (asyncSnapshot.hasData) {
                          return 
      Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  color: Color(0xFFFFFFFF),
                  child:Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 12),
                                padding: EdgeInsets.only(left: 12),
                                alignment: Alignment.centerLeft,
                                child: Image.asset(
                                  "assets/images/butonimage.png",
                                  height: 28,
                                  width: 28,
                                ),
                              ),
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  height: 221,
                                  width:
                                      MediaQuery.of(context).size.width * 0.93,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          asyncSnapshot.data
                                              .data()['pictureUrl']
                                              .toString()),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 30,
                              margin: EdgeInsets.only(top: 21, bottom: 9),
                              padding: EdgeInsets.only(left: 23, right: 10),
                              child: Row(
                                children: [
                                  Text(
                                    asyncSnapshot.data.data()["name"],
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                        color: Colors.black),
                                  ),
                                  SizedBox(width: 65),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AdminCafeMenuState(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 30,
                                      margin: EdgeInsets.only(left: 85),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/menu.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                       )),
              PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: Container(
                    color: Colors.white,
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Color(0xFFB6B7C8),
                      tabs: [
                        Tab(
                          text: "Kampanyalar",
                        ),
                        Tab(
                          text: "Bilgi",
                        ),
                        Tab(
                          text: "Yorum",
                        )
                      ],
                    ),
                  )),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(247, 248, 251, 1),
                        ),
                        child: SingleChildScrollView(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              margin:
                                  EdgeInsets.only(left: 9, top: 11, right: 16),
                              padding: EdgeInsets.only(
                                  left: 15, top: 12, bottom: 12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(right: 28),
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
                                        OfferModel().createString(cafeId);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AdminUpdateOffer(cafeId),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 20,
                                        child: Text(
                                          "Kampanya Ekle",
                                          style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                                     StreamBuilder<QuerySnapshot>(stream: ref.snapshots(),builder: (BuildContext context,AsyncSnapshot asyncSnapshot1){
  
if(asyncSnapshot1.data==null){
  return CircularProgressIndicator();

}
if(asyncSnapshot1.hasError){
  return Center(child: Text("Bir hata oluştu, tekrar deneyiniz."),);
}
else{
  if(asyncSnapshot1.hasData){
      return 
        Row(children: [
              Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height-508,
            child: new ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: asyncSnapshot1.data.docs.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return  Container(
                              height: 215,
                              padding: EdgeInsets.only(
                                  top: 13, left: 15, right: 15, bottom: 15),
                              margin: EdgeInsets.only(bottom: 10, top: 10),
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Column(children: [
                                Container(
                                    child: Row(
                                  children: [
                                    Container(
                                      height: 67,
                                      padding:
                                          EdgeInsets.only(top: 20, left: 18),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Kampanya ${(index+1).toString()}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height: 67,
                                      padding: EdgeInsets.only(
                                        top: 20,
                                      ),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        ": ${asyncSnapshot1.data.docs[index]["offerTitle"].toString()}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminUpdateOffer(cafeId),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 67,
                                          padding: EdgeInsets.only(
                                              top: 20, left: 70),
                                          color: Colors.white,
                                          alignment: Alignment.topRight,
                                          child: Image.asset(
                                            "assets/images/duzenle.png",
                                            height: 19,
                                            width: 19,
                                          ),
                                        ))
                                  ],
                                )),
                                Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                      image: CachedNetworkImageProvider(asyncSnapshot1.data.docs[index]['pictureUrl'].toString()),
                                    ),),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/zil.png'))),
                                        width: 25,
                                        height: 25,
                                      ),
                                      Text(
                                        asyncSnapshot1.data.docs[index]['offerTag'].toString(),
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  asyncSnapshot1.data.docs[index]['description'].toString(),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromRGBO(182, 183, 200, 1)),
                                )
                              ]),
                            );
                      
              },
            ),
          ),
        )
        ],);

  }
  else{
    return Center(child: CircularProgressIndicator(),);
  }
  
}
})
 ],
                                      
                        ))),
                    Container(
                        color: Color(0xFFF7F8FB),
                        // alignment: Alignment.centerLeft,

                        child: Column(
                          children: [
                            Container(
                              height: 72,
                              margin: EdgeInsets.only(
                                  left: 9, top: 11, right: 16, bottom: 2),
                              padding:
                                  EdgeInsets.only(left: 15, top: 12, bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(right: 28),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/location_icon.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 36,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Text(
                                     asyncSnapshot.data.data()["cafeAddress"],
                                      style: GoogleFonts.roboto(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    padding: EdgeInsets.only(
                                      top: 15,
                                    ),
                                    color: Colors.white,
                                    alignment: Alignment.topRight,
                                    child: Image.asset(
                                      "assets/images/duzenle.png",
                                      height: 19,
                                      width: 19,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 72,
                              margin: EdgeInsets.only(
                                  left: 9, right: 16, bottom: 2),
                              padding: EdgeInsets.only(
                                  left: 15, top: 12, bottom: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(right: 28),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/time_icon.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 15),
                                    height: 36,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Text(
                                      "${asyncSnapshot.data.data()["openClock"]}-${asyncSnapshot.data.data()["closeClock"]}",
                                      maxLines: 2,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    padding: EdgeInsets.only(
                                      top: 15,
                                    ),
                                    color: Colors.white,
                                    alignment: Alignment.topRight,
                                    child: Image.asset(
                                      "assets/images/duzenle.png",
                                      height: 19,
                                      width: 19,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 72,
                              margin: EdgeInsets.only(left: 9, right: 16),
                              padding: EdgeInsets.only(
                                  left: 15, top: 12, bottom: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(right: 28),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/user_icon.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 36,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Text(
                                      "10 masadan 5 tanesi dolu %50 doluluk bulunmakta ",
                                      maxLines: 2,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                    Container(
                        child: Column(
                      children: <Widget>[
                        Expanded(
                          child: SingleChildScrollView(
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  //comment
                                  Container(
                                      margin: EdgeInsets.only(top: 21),
                                      padding: EdgeInsets.only(bottom: 15),
                                      width: MediaQuery.of(context).size.width *
                                          0.93,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5))),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AdminCommentDetailState(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                                margin: EdgeInsets.only(top: 9),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.93,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    15),
                                                            topRight:
                                                                Radius.circular(
                                                                    15),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5))),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      height: 15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.93,
                                                      margin: EdgeInsets.only(
                                                          left: 15,
                                                          top: 18,
                                                          bottom: 8),
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
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 4),
                                                            height: 15,
                                                            child: Text('4.1',
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontSize: 12,
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      height: 15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.93,
                                                      margin: EdgeInsets.only(
                                                          left: 15, bottom: 8),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              "Ahmet Yılmaz",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                color: Color(
                                                                    0xFFF07618),
                                                                fontSize: 14,
                                                                //figma 12 yazıyodu kodda güncelledim fontsize ı
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 12),
                                                            child: Text(
                                                              "10 Kasım 2021 | 11:30",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                color: Color(
                                                                    0xFF7C7C7C),
                                                                fontSize: 14,
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
                                                      child: Text(
                                                        "Dinlendiren , otururken kendinizi ortamın sakinliğine ve hosluguna istemeden bıraktığınız bir mekan . Hayran olunasııı",
                                                        style:
                                                            GoogleFonts.roboto(
                                                          color:
                                                              Color(0xFF000000),
                                                          fontSize: 14,
                                                          //figma 12 yazıyodu burada da güncelledim fontsize ı
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          )
                                        ],
                                      )),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AdminCommentDetailState(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(top: 21),
                                        padding: EdgeInsets.only(bottom: 15),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.93,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(5),
                                                bottomRight:
                                                    Radius.circular(5))),
                                        child: Column(
                                          children: [
                                            Container(
                                                margin: EdgeInsets.only(top: 9),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.93,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    15),
                                                            topRight:
                                                                Radius.circular(
                                                                    15),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5))),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      height: 15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.93,
                                                      margin: EdgeInsets.only(
                                                          left: 15,
                                                          top: 18,
                                                          bottom: 8),
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
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 4),
                                                            height: 15,
                                                            child: Text('4.1',
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontSize: 12,
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      height: 15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.93,
                                                      margin: EdgeInsets.only(
                                                          left: 15, bottom: 8),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              "Ahmet Yılmaz",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                color: Color(
                                                                    0xFFF07618),
                                                                fontSize: 14,
                                                                //figma 12 yazıyodu kodda güncelledim fontsize ı
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 12),
                                                            child: Text(
                                                              "10 Kasım 2021 | 11:30",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                color: Color(
                                                                    0xFF7C7C7C),
                                                                fontSize: 14,
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
                                                      child: Text(
                                                        "Dinlendiren , otururken kendinizi ortamın sakinliğine ve hosluguna istemeden bıraktığınız bir mekan . Hayran olunasııı",
                                                        style:
                                                            GoogleFonts.roboto(
                                                          color:
                                                              Color(0xFF000000),
                                                          fontSize: 14,
                                                          //figma 12 yazıyodu burada da güncelledim fontsize ı
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        )),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AdminCommentDetailState(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(top: 21),
                                        padding: EdgeInsets.only(bottom: 15),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.93,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(5),
                                                bottomRight:
                                                    Radius.circular(5))),
                                        child: Column(
                                          children: [
                                            Container(
                                                margin: EdgeInsets.only(top: 9),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.93,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    15),
                                                            topRight:
                                                                Radius.circular(
                                                                    15),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5))),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      height: 15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.93,
                                                      margin: EdgeInsets.only(
                                                          left: 15,
                                                          top: 18,
                                                          bottom: 8),
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
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 4),
                                                            height: 15,
                                                            child: Text('4.1',
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontSize: 12,
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      height: 15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.93,
                                                      margin: EdgeInsets.only(
                                                          left: 15, bottom: 8),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              "Ahmet Yılmaz",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                color: Color(
                                                                    0xFFF07618),
                                                                fontSize: 14,
                                                                //figma 12 yazıyodu kodda güncelledim fontsize ı
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 12),
                                                            child: Text(
                                                              "10 Kasım 2021 | 11:30",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                color: Color(
                                                                    0xFF7C7C7C),
                                                                fontSize: 14,
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
                                                      child: Text(
                                                        "Dinlendiren , otururken kendinizi ortamın sakinliğine ve hosluguna istemeden bıraktığınız bir mekan . Hayran olunasııı",
                                                        style:
                                                            GoogleFonts.roboto(
                                                          color:
                                                              Color(0xFF000000),
                                                          fontSize: 14,
                                                          //figma 12 yazıyodu burada da güncelledim fontsize ı
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      );

                     } 
                     else{
                       return CircularProgressIndicator() ;
                     } }),);
  }
}
