

import 'dart:io';
import 'dart:math';

import 'package:cafeapp/Models/CafeModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage ;
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
static String adminName="";
static String userName="";

static List<CafeModel> model;


  //kullanıcı giriş yap fonksiyonu
  Future<String> signInUser(String email, String password) async {

   try {
      var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
        
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
        
  var Admin=await _firestore
        .collection("usersAndAdmins").doc(user.user.uid).get();
      bool isAdmin=false;
      if(Admin.data()["role"]=="admin"){
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

  Future<void> click() async {
    model = await getDocs();
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
    tempmodel.add(model1);
    }

   
    return tempmodel;
   
  }


  //admin kayıt ol fonksiyonu

  Future<User> createAdmin(
      String name, String email, String password, String PhoneNumber) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    adminName = name;
    await _firestore
        .collection("admin")
        .doc(user.user.uid)
        .set({'userName': name, 'email': email, 'phoneNumber': PhoneNumber});
          await _firestore
        .collection("usersAndAdmins")
        .doc(user.user.uid)
        .set({'userName': name, 'email': email, 'role': "admin",'uid':user.user.uid});
    await user.user.sendEmailVerification();
    return user.user;
  }

  Future<User> createUser(
      String name, String email, String password, String PhoneNumber) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
        user.user.sendEmailVerification();

    await _firestore.collection("user").doc(user.user.uid).set({
      'mailAddress': email,
      'nameSurname': name,
      'phoneNumber': PhoneNumber,
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
        FirebaseFirestore.instance.collection("cafe").doc(uid).set({
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
                                'pdfUrl':pdfUrl
                                
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

}
