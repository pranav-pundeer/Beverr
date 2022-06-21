import 'package:beverr/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase{

  final String uid;
  DataBase({required this.uid} );

  final CollectionReference BeverrUsers= FirebaseFirestore.instance.collection('Users');

  Future updateUserData(String sugar, String name, int strength, String email)async{
    return await BeverrUsers.doc(uid).set({
      'sugar': sugar,
      'name' : name,
      'strength': strength,
      'email': email,
    });
  }

  //get the stream of snapshot of BeverrUsers at the current time
  Stream<QuerySnapshot> get beverrUsersData{
    return BeverrUsers.snapshots();
  }

  //userDataModel from firestore document snapshot
  UserDataModel _userDataModelFromSnapshot(DocumentSnapshot snapshot){
    return UserDataModel(
      uid: uid,
      name: snapshot.get('name'),
      sugar: snapshot.get('sugar'),
      strength: snapshot.get('strength'),
      email: snapshot.get('email'),
    );
  }

  //get the stream of document snapshot of a particular user at the current time
  Stream<UserDataModel> get userData{
      return BeverrUsers.doc(uid).snapshots().map((_userDataModelFromSnapshot));
  }
}