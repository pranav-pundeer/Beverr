import 'package:beverr/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../../constants/UserTile.dart';
import '../../models/userModel.dart';
import '../../services/auth.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);
  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {

    final CollectionReference BeverrUsers= FirebaseFirestore.instance.collection('Users');

    final String currentUserId= FirebaseAuth.instance.currentUser!.uid;

    Object obj= BeverrUsers.doc(currentUserId).get();

    print(obj);
    final beverrUsers= Provider.of<QuerySnapshot?>(context);
    int len= beverrUsers?.size?? 0;


    return Align(
      alignment: Alignment.topCenter,
      child: ListView.builder(
          reverse: true,
          itemCount: len,
          shrinkWrap: true,
          itemBuilder: (context, index){
              final name= beverrUsers?.docs[index].get('name');
              print(name);

              return UserTile(
                // flag: name== signedInUserName?1: 0,
                name: beverrUsers?.docs[index].get('name'),
                sugar: beverrUsers?.docs[index].get('sugar'),
                strength: beverrUsers?.docs[index].get('strength'),
              );
          },
          physics: const BouncingScrollPhysics(),

      ),
    );
  }
}
