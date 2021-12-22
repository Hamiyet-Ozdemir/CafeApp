import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //giriş yap fonksiyonu
  Future<User> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
        adminName="emre";
    return user.user;
  }
  //çıkış yap fonksiyonu
  signOut() async {
    return await _auth.signOut();
  }

  //admin kayıt ol fonksiyonu
static String adminName;

  Future<User> createAdmin(String name, String email, String password,String PhoneNumber) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
adminName=name;
    await _firestore
        .collection("admin")
        .doc(user.user.uid)
        .set({'userName': name, 'email': email,'phoneNumber':PhoneNumber});

    return user.user;
  }

   Future<User> createUser(String name, String email, String password,String PhoneNumber) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection("user")
        .doc(user.user.uid)
        .set({'mailAddress':email,'nameSurname':name,'phoneNumber':PhoneNumber,'userPoint':100
});

    return user.user;
  }
}