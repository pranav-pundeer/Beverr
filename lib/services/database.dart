import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase{

  final String? uid;
  DataBase({this.uid} );

  final CollectionReference BeverrUsers= FirebaseFirestore.instance.collection('Users');

  Future updateUserData(String sugar, String name, int strength)async{
    return await BeverrUsers.doc(uid).set({
      'sugar': sugar,
      'name' : name,
      'strength': strength,
    });
  }

  //get the stream of snapshot of BeverrUsers at the current time
  Stream<QuerySnapshot> get beverrUsersData{
    return BeverrUsers.snapshots();
  }
}