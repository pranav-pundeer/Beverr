import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../models/userModel.dart';

class AuthService{

  final FirebaseAuth _auth= FirebaseAuth.instance;

  //create custom UserModel from FirebaseUser/User
  UserModel? _userFromFirebaseUser(User? result){
    return result!= null? UserModel(uid: result.uid): null;
  }

  //create stream to listen to authentication changes
  Stream<UserModel?> get user{
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
        //.map() maps the user it gets from firebase to our custom user UserModel
  }

  //sign in anonymously
  Future signInAnonymously() async{
    try{
      UserCredential result=  await _auth.signInAnonymously();
      User? user= result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result= await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user= result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out of the homescreen
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
    }
  }

  Future registerWithMailAndPassword(String email, String password)async {
    try{
      UserCredential result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user= result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}
