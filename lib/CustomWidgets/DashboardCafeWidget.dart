import 'package:cafeapp/Models/CafeModel.dart';
import 'package:cafeapp/Pages/User/UserCafeDetailPage/UserCafeDetailView.dart';
import 'package:cafeapp/Pages/User/UserMakeRezervationPage/UserMakeRezervationView.dart';
import 'package:cafeapp/service/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CafeCardWidget extends StatefulWidget {
  final int index;
  List<CafeModel> cafeModel =
      []; //şu an olması gerekiyor sanırım burda mısıııın vay be
  CafeCardWidget({int index, List<CafeModel> cafeModel})
      : this.index = index,
        this.cafeModel = cafeModel;
  _CafeCardWidgetState createState() => _CafeCardWidgetState(index, cafeModel);
}

class _CafeCardWidgetState extends State<CafeCardWidget> {
  _CafeCardWidgetState(this.index, this.cafeModel);

  void addCafeToFavorites() async {
    var uuid = Uuid();
    FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("FavoriteCafes")
        .doc(AuthService.ModelCafe[index].cafeId)
        .set({'CafeId': AuthService.ModelCafe[index].cafeId});
  }

  final int index;
  final List<CafeModel> cafeModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserCafeDetailState(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
        padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 20),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 105,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                        image: NetworkImage(cafeModel[index].pictureUrl),
                        fit: BoxFit.fill),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      //User içine favorilere kaydedicek
                      addCafeToFavorites();
                      print(FirebaseAuth.instance.currentUser.uid);
                      print("*****************");

                      print(FirebaseAuth.instance.currentUser.uid);
                    },
                    child: Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(bottom: 20,right: 20),
                      child: Image.asset(
                        "assets/images/favorites_icon.png",
                        width: 40,
                        height: 40,
                      ),
                    ))
              ],
            ),
            Container(
              height: 21,
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 19),
              child: Row(
                children: [
                  Text(
                    cafeModel[index].name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "%80 Dolu",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 22,
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.only(left: 19),
              child: Row(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/discount_icon.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                  SizedBox(width: 8),
                  const Text(
                    "2 ile 8 arası çay %10 indirimli",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 30,
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.only(left: 22, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/images/star_image.png",
                              width: 70,
                              height: 70,
                            ),
                          ),
                          SizedBox(width: 2),
                          const Text(
                            "4.1",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(117, 116, 116, 1)),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserMakeRezervation(AuthService.model[postId].cafeId,AuthService.model[postId].name),
                            ),
                          );
                        },
                        child: Container(
                          width: 120,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFF07618),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Text(
                            "Rezervasyon Yap",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
