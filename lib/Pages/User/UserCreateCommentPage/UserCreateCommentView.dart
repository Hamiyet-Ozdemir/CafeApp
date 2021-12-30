

import 'package:cafeapp/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
class CreateComment extends StatefulWidget{
  final String cafeId;

  const CreateComment(this.cafeId,{Key key}) : super(key: key);
  State<CreateComment> createState()=> CreateCommentState(cafeId);
}

class CreateCommentState extends State<CreateComment> {


  CreateCommentState(String cafeId){this.cafeId=cafeId;}

  //firebase get username
  String username=AuthService.userName;
  String cafeId="";
  int firstStarColor=0xFFC4C4C4;
  int secondStarColor=0xFFC4C4C4;
  int thirdStarColor=0xFFC4C4C4;
  int fourthStarColor=0xFFC4C4C4;
  int fifthStarColor=0xFFC4C4C4;

  final TextEditingController comment = TextEditingController();

  //aynı şekilde buna da nereden geliyosa orada cafeid vermelisin



  final String assetName="assets/icons/Star.svg";
  int index;

    Future<void> selectedStars(int index) async{
    switch (index){
      case 1: {
        setState(() {
          this.index=index;
          firstStarColor=0xFF1B7CA2;
          secondStarColor=0xFFC4C4C4;
          thirdStarColor=0xFFC4C4C4;
          fourthStarColor=0xFFC4C4C4;
          fifthStarColor=0xFFC4C4C4;
        });
      }
      break;
      case 2: {
        setState(() {
          this.index=index;
          firstStarColor=0xFF1B7CA2;
          secondStarColor=0xFF1B7CA2;
          thirdStarColor=0xFFC4C4C4;
          fourthStarColor=0xFFC4C4C4;
          fifthStarColor=0xFFC4C4C4;
        });
      }
      break;
      case 3: {
        setState(() {
          this.index=index;
          firstStarColor=0xFF1B7CA2;
          secondStarColor=0xFF1B7CA2;
          thirdStarColor=0xFF1B7CA2;
          fourthStarColor=0xFFC4C4C4;
          fifthStarColor=0xFFC4C4C4;
        });
      }
      break;
      case 4: {
        setState(() {
          this.index=index;
          firstStarColor=0xFF1B7CA2;
          secondStarColor=0xFF1B7CA2;
          thirdStarColor=0xFF1B7CA2;
          fourthStarColor=0xFF1B7CA2;
          fifthStarColor=0xFFC4C4C4;
        });
      }
      break;
      case 5: {
        setState(() {
          this.index=index;
          firstStarColor=0xFF1B7CA2;
          secondStarColor=0xFF1B7CA2;
          thirdStarColor=0xFF1B7CA2;
          fourthStarColor=0xFF1B7CA2;
          fifthStarColor=0xFF1B7CA2;
        });
      }
      break;
    }
  }

//listener for property

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
   String time =now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString();
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FB),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 24),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            child: Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.only(top: 3, left: 12, right: 12),

                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          Image.asset(
                            "assets/images/butonimage.png",
                            height: 28,
                            width: 28,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 56),
                            height: 28,
                            child: Text('Starbucks Coffe',
                                style: GoogleFonts.roboto(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                         GestureDetector(
                           onTap: (){
                             AuthService().createComment(cafeId, username, index, time, comment.text, 0, 0);
                           },
                           child:  Container(
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
                           ),
                         )
                        ]),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 25, top: 9),
                      child: Text(
                        username,
                        style: GoogleFonts.roboto(
                            fontSize: 20, color: Color(0xFFF07618)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 13),
                      alignment: Alignment.centerRight,
                    height: 50,
                      width: 261,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              selectedStars(1);
                            },
                            child: SvgPicture.asset(
                              assetName,
                              height: 39,
                              width: 39,
                              color: Color(firstStarColor),
                            ),
                          ),

                          SizedBox(width: 13),
                          GestureDetector(
                            onTap: (){
                              selectedStars(2);
                            },
                            child: SvgPicture.asset(
                              assetName,
                              height: 39,
                              width: 39,
                              color: Color(secondStarColor),
                            ),
                          ),
                          SizedBox(width: 13),
                          GestureDetector(
                            onTap: (){
                              selectedStars(3);
                            },
                            child: SvgPicture.asset(
                              assetName,
                              height: 39,
                              width: 39,
                              color: Color(thirdStarColor),
                            ),
                          ),
                          SizedBox(width: 13),
                          GestureDetector(
                            onTap: (){
                              selectedStars(4);
                            },
                            child: SvgPicture.asset(
                              assetName,
                              height: 39,
                              width: 39,
                              color: Color(fourthStarColor),
                            ),
                          ),
                          SizedBox(width: 13),
                          GestureDetector(
                            onTap: (){
                              selectedStars(5);
                            },
                            child: SvgPicture.asset(
                              assetName,
                              height: 39,
                              width: 39,
                              color: Color(fifthStarColor),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      //color: Color(0xFF000000),
                      alignment: Alignment.centerLeft,

                      height: 18,
                      margin: EdgeInsets.only(top: 12, bottom: 8),
                      padding: EdgeInsets.only(left: 33),
                      child: Text(
                        "Deneyiminizi Paylaşın",
                        style: GoogleFonts.roboto(fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12, right: 12),
                      padding: EdgeInsets.only(left: 21, right: 14),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.294,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Color(0xFFFFFFFF)),
                      child: TextFormField(
                        controller: comment,
                        keyboardType: TextInputType.multiline,
                        maxLines: 6,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Yorumunuzu buraya yazın..",
                            hintStyle: TextStyle(
                                color: Colors.grey[400], fontSize: 13)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
