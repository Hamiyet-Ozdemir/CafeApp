

import 'dart:io';
import 'dart:math';

import 'package:cafeapp/Models/CafeModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage ;
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
static String adminName="";
static String userName="";
static String userPoint="";

static List<CafeModel> model;

  //kullanıcı giriş yap fonksiyonu
  Future<String> signInUser(String email, String password) async {
  
    model = await getDocs();
   try {
      var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
          await getFavCafeList();

  var userr=await _firestore
        .collection("usersAndAdmins").doc(user.user.uid).get();
      bool isUser=false;
      if(userr.data()["role"]=="user"){
        isUser=true;
      }

       if (isUser==true) {
          if(user.user.emailVerified==false){
          user.user.sendEmailVerification();
          return "Hesabınızı doğrulayınız";
        }
           var deneme=await _firestore
        .collection("user")
        .doc(user.user.uid)
        .get();
        userName=deneme['nameSurname'].toString();
        userPoint=deneme['userPoint'].toString();
 
     
        return "true";
       }
       else{
         return "Yönetici girişi yapmayı deneyiniz";
       }
    
   }on FirebaseAuthException catch  (e) {
     if (e.code=='user-not-found') {
       return "Bu mail adresine ait kullanıcı bulunamadı";
     }
      
      if (e.code=='wrong-password') {
       return "Şifrenizi hatalı girdiniz. Lütfen Tekrar deneyiniz ";
     }
     else{
       return e.code;
     }
   }
  }
     //admin giriş yap fonksiyonu
      Future<String> signInAdmin(String email, String password) async {


   try {
      var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
        
  var admin=await _firestore
        .collection("usersAndAdmins").doc(user.user.uid).get();
      bool isAdmin=false;
      if(admin.data()["role"]=="admin"){
        isAdmin=true;
      }
    if (isAdmin==true) {
        if(user.user.emailVerified==false){
          user.user.sendEmailVerification();
          return "Hesabınızı doğrulayınız";
        }
           var deneme=await _firestore
        .collection("admin")
        .doc(user.user.uid)
        .get();
        adminName=deneme['userName'].toString();
 
     
        return "true";
    }else{
      return "Kullanıcı girişi yapmayı deneyiniz";
    }
        

   
       
   }on FirebaseAuthException catch  (e) {
     if (e.code=='user-not-found') {
       return "Bu mail adresine ait yönetici bulunamadı";
     }
      
      if (e.code=='wrong-password') {
       return "Şifrenizi hatalı girdiniz. Lütfen Tekrar deneyiniz ";
     }
     else{
       return e.code;
     }
   }
  }
     
  //çıkış yap fonksiyonu
  signOut() async {
    return await _auth.signOut();
  }

  
//get rezervation
Future<List<RezervationModel>> getRezervationByUser() async{
  List<RezervationModel> rezervationmodel=List<RezervationModel>();
    var rezervasyonlar=await _firestore.collection("user").doc("8lUaVak3E0QoWhv761INrKyxE7h2").
     collection("reservation").get();
     var data=rezervasyonlar.docs;
    for (var i = 0; i < data.length; i++) {
    RezervationModel modell=RezervationModel();
    var c=await _firestore.collection("cafe").doc(data[i]["cafeId"]).get();
    var d=await _firestore.collection("cafe").doc(data[i]["cafeId"])
    .collection("rezervasyonlar").where("userId",isEqualTo: "8lUaVak3E0QoWhv761INrKyxE7h2").get();
    var t=d.docs.last;
  
    modell.userRezervationId=data[i].id;
    modell.cafeId=data[i]["cafeId"];
    modell.cafeName=c.data()["name"];
    modell.cafeRezervationId=t.id;
    modell.date=data[i]["date"];
    modell.note=data[i]["note"];
    modell.people=data[i]["people"];
    modell.userName=data[i]["name"];
    modell.userId=data[i]["userId"];
    rezervationmodel.add(modell);
    }
    
    return rezervationmodel;
}
//get all cafe
Future<List<CafeModel>> getDocs() async {
    List<CafeModel> tempmodel=new List<CafeModel>();
    
    var temp=await _firestore.collection("cafe").get();
    var data=temp.docs;
  
     
for (var i = 0; i < data.length; i++) {
    CafeModel model1=new CafeModel();
    model1.adminId=data[i]["adminId"];
    model1.cafeAddress=data[i]["cafeAddress"];
    model1.closeClock=data[i]["closeClock"];
    model1.description=data[i]["description"];
    model1.menu=data[i]["menu"];
    model1.name=data[i]["name"];
    model1.openClock=data[i]["openClock"];
    model1.phoneNumber=data[i]["phoneNumber"];
    model1.picture=data[i]["picture"];
    model1.safeId=data[i]["safeId"];
    model1.pictureUrl=data[i]["pictureUrl"];
    model1.pdfUrl=data[i]["pdfUrl"];
    model1.cafeId=data[i].id;
    tempmodel.add(model1);
    }

   
    return tempmodel;
   
  }


  //admin kayıt ol fonksiyonu

  Future<User> createAdmin(
      String name, String email, String password, String phoneNumber) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    adminName = name;
    await _firestore
        .collection("admin")
        .doc(user.user.uid)
        .set({'userName': name, 'email': email, 'phoneNumber': phoneNumber});
          await _firestore
        .collection("usersAndAdmins")
        .doc(user.user.uid)
        .set({'userName': name, 'email': email, 'role': "admin",'uid':user.user.uid});
    await user.user.sendEmailVerification();
    return user.user;
  }

  Future<User> createUser(
      String name, String email, String password, String phoneNumber) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
        user.user.sendEmailVerification();

    await _firestore.collection("user").doc(user.user.uid).set({
      'mailAddress': email,
      'nameSurname': name,
      'phoneNumber': phoneNumber,
      'userPoint': 100
    });
  await _firestore
        .collection("usersAndAdmins")
        .doc(user.user.uid)
        .set({'userName': name, 'email': email, 'role': "user",'uid':user.user.uid});
    return user.user;
  }


  //kafe ekle
  void addCafe(PickedFile pickedFile,String name,String cafeAddress,String safeId,String openClock,
String closeClock,String description,String phoneNumber,String menu,
String picture,String adminId,File file) async{


   var uuid = Uuid();
    File _imageFile=File(pickedFile.path);
    String fileName = randomName()+"."+_imageFile.path.split('.').last;
    String pdfName = randomName()+".pdf";

    firebase_storage.Reference firebaseStorageRef =
        firebase_storage.FirebaseStorage.instance.ref().child('cafeImages/$fileName');

    firebase_storage.UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
  

        firebase_storage.Reference firebaseStorageRef1 =
        firebase_storage.FirebaseStorage.instance.ref().child('cafeMenuPdf/$pdfName');
    firebase_storage.UploadTask uploadTask1=firebaseStorageRef1.putFile(file);
   
 var dowPictureUrl = await (await uploadTask).ref.getDownloadURL();
    String pictureUrl = dowPictureUrl.toString();
var dowPdfUrl = await (await uploadTask1).ref.getDownloadURL();
    String pdfUrl = dowPdfUrl.toString();
String uid=uuid.v1().toString();
       await FirebaseFirestore.instance.collection("cafe").doc(uid).set({
                                'name': name,
                                'cafeAddress': cafeAddress,
                                'safeId': safeId,
                                'openClock': openClock,
                                'closeClock': closeClock,
                                'description': description,
                                'phoneNumber': phoneNumber,
                                'menu': menu,
                                'picture': picture,
                                'adminId':adminId,
                                'pictureUrl':pictureUrl,
                                'pdfUrl':pdfUrl,
                                'cafeId':uid.replaceAll(" ", "")
                                
                              }).then((value) => print("cafe added"));

                  

        FirebaseFirestore.instance
        .collection("admin")
        .doc(FirebaseAuth.instance.currentUser.uid).collection("cafes").doc(uid)
        .set({'name': name});
        

}
 
String randomName(){
   var rng = new Random();
     String randomName="";
  for (var i = 0; i < 20; i++) {
    print(rng.nextInt(100));
    randomName += rng.nextInt(100).toString();
  }
  return randomName;
}

//rezervasyon ekle
  void addRezervation(String peoplecounter,String cafeId,String note,String date,String cafeName) async{


        FirebaseFirestore.instance.collection("cafe").doc(cafeId).collection("rezervasyonlar").doc().set({
                                'name': userName,
                                'userId': _auth.currentUser.uid,
                                'date': date,
                                'note': note,
                                'people': peoplecounter,


                              }).then((value) => print("rezervation added"));

                  

        FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser.uid).collection("reservation").doc()
        .set({ 'name': userName,
                                'userId': _auth.currentUser.uid,
                                'date': date,
                                'note': note,
                                'people': peoplecounter,
                                'cafeId':cafeId,
                                'cafeName':cafeName});
        

}

 void updateRezervation(String peoplecounter,
 String cafeId ,String note,String date,String caferezervationId,String userrezervationId) async{


        FirebaseFirestore.instance.collection("cafe").doc(cafeId).collection("rezervasyonlar")
        .doc(caferezervationId).update({
                                'name': userName,
                                'userId': _auth.currentUser.uid,
                                'date': date,
                                'note': note,
                                'people': peoplecounter,
                                
                                
                              }).then((value) => print("rezervation update"));

                  

        FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser.uid).collection("reservation").doc(userrezervationId)
        .update({ 'name': userName,
                                'userId': _auth.currentUser.uid,
                                'date': date,
                                'note': note,
                                'people': peoplecounter,
                                'cafeId':cafeId});
        

}

void deleteRezervation(
 String cafeId ,String caferezervationId,String userrezervationId) async{


        FirebaseFirestore.instance.collection("cafe").doc(cafeId).collection("rezervasyonlar")
        .doc(caferezervationId).delete();

                  

        FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser.uid).collection("reservation").doc(userrezervationId)
        .delete();
        

}






static List<String> FavoriteCafeList = List<String>();

Future<void> getFavCafeList() async{


    Stream<QuerySnapshot> ref1 = await FirebaseFirestore.instance
        .collection("user")
        .doc(_auth.currentUser.uid)
        .collection("FavoriteCafes")
        .snapshots();

    ref1.forEach((QuerySnapshot element) {
      if (element == null) return;
else{
  FavoriteCafeList.clear();
    for (int count = 0; count < element.docs.length; count++) {
        FavoriteCafeList.add(element.docs[count]["cafeId"]);
      }
}
    
    });

  }

void addCafeToFavorites(String cafeId) async {
    
    FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("FavoriteCafes")
        .doc(cafeId)
        .set({'cafeId': cafeId});

           FirebaseFirestore.instance
        .collection("cafe")
        .doc(cafeId)
        .collection("FavoritedUser")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .set({'userId': FirebaseAuth.instance.currentUser.uid});
                AuthService.FavoriteCafeList.add(cafeId);

  } 
  Future<void> deleteCafeToFavorites(String cafeId) async {
    
    FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("FavoriteCafes")
        .doc(cafeId).delete();

           FirebaseFirestore.instance
        .collection("cafe")
        .doc(cafeId)
        .collection("FavoritedUser")
        .doc(FirebaseAuth.instance.currentUser.uid).delete();
        AuthService.FavoriteCafeList.remove(cafeId);
  } 

  Future<void> createOffer(String cafeId, String offerTitle ,String offerDetail ,String offerTag ,String description ,PickedFile pickedFile) async {
     var uuid = Uuid();
    File _imageFile=File(pickedFile.path);
    String fileName = randomName()+"."+_imageFile.path.split('.').last;
    
    firebase_storage.Reference firebaseStorageRef =
    firebase_storage.FirebaseStorage.instance.ref().child('offerImages/$fileName');

    firebase_storage.UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
  

  var dowPictureUrl = await (await uploadTask).ref.getDownloadURL();
    String pictureUrl = dowPictureUrl.toString();
    await FirebaseFirestore.instance.collection("cafe").doc(cafeId).collection("kampanyalar").doc().set({
      'offerTitle': offerTitle,
      'offerDetail': offerDetail,
      'offerTag': offerTag,
      'description': description,
      'pictureUrl': pictureUrl
    });
  }

  Future<void> updateOffer(String docId,String cafeId, String offerTitle ,String offerDetail ,String offerTag ,String description ,PickedFile pickedFile) async {
     var uuid = Uuid();
    File _imageFile=File(pickedFile.path);
    String fileName = randomName()+"."+_imageFile.path.split('.').last;

    firebase_storage.Reference firebaseStorageRef =
    firebase_storage.FirebaseStorage.instance.ref().child('offerImages/$fileName');

    firebase_storage.UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);


  var dowPictureUrl = await (await uploadTask).ref.getDownloadURL();
    String pictureUrl = dowPictureUrl.toString();
    await FirebaseFirestore.instance.collection("cafe").doc(cafeId).collection("kampanyalar").doc(docId).update({

      'offerTitle': offerTitle,
      'offerDetail': offerDetail,
      'offerTag': offerTag,
      'description': description,
      'pictureUrl': pictureUrl
    });
  }


  //yorum oluşturma
  Future<void> createComment(
      String cafeId, String username,String date, String comment,int like,int unlike) async {
    await FirebaseFirestore.instance.collection("cafe").doc(cafeId).collection("yorumlar").doc().set({
      'username': username,
      'date': date,
      'comment': comment,
      'like': like,
      'unlike': unlike
    });

    await FirebaseFirestore.instance.collection("user").doc(FirebaseAuth.instance.currentUser.uid).collection("yorumlar").doc().set({
      'username': username,
      'date': date,
      'comment': comment,
      'like': like,
      'unlike': unlike
    });

  }
  Future<void> updateMenu(
      String cafeId,File file) async {
        String pdfName = randomName()+".pdf";
                firebase_storage.Reference firebaseStorageRef1 =
        firebase_storage.FirebaseStorage.instance.ref().child('cafeMenuPdf/$pdfName');
    firebase_storage.UploadTask uploadTask1=firebaseStorageRef1.putFile(file);
   
 
var dowPdfUrl = await (await uploadTask1).ref.getDownloadURL();
    String pdfUrl = dowPdfUrl.toString();



    await FirebaseFirestore.instance.collection("cafe").doc(cafeId).update({
      'pdfUrl': pdfUrl,
      
    });


  }
}
