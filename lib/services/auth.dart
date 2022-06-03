import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService{

  final FirebaseAuth _auth= FirebaseAuth.instance;

  //sign in anonymously
  Future signInAnonymously() async{
    try{
      UserCredential result=  await _auth.signInAnonymously();
      User? user= result.user;
      return user;
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
