import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../../constants/UserTile.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);
  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {

  final currentUserEmail= FirebaseAuth.instance.currentUser?.email;
  final CollectionReference BeverrUsers= FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {

    final beverrUsers= Provider.of<QuerySnapshot?>(context);
    int len= beverrUsers?.size?? 0;
    return Align(
      alignment: Alignment.topCenter,
      child: ListView.builder(
          // reverse: true,
          itemCount: len,
          shrinkWrap: true,
          itemBuilder: (context, index){
                if(currentUserEmail!= beverrUsers?.docs[index].get('email')) {
                  return UserTile(
                    name: beverrUsers?.docs[index].get('name'),
                    sugar: beverrUsers?.docs[index].get('sugar'),
                    strength: beverrUsers?.docs[index].get('strength'),
                  );
                }else{
                  return const SizedBox(height: 0,);
                }
              },
          physics: const BouncingScrollPhysics(),

      ),
    );
  }
}
