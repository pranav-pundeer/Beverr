import 'package:beverr/services/database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../../constants/UserTile.dart';
import '../../models/userModel.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);
  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {

    final currentUser= Provider.of<DocumentSnapshot?>(context);
    final beverrUsers= Provider.of<QuerySnapshot?>(context);
    int len= beverrUsers?.size?? 0;

    return Align(
      alignment: Alignment.topCenter,
      child: ListView.builder(
          reverse: true,
          itemCount: len,
          shrinkWrap: true,
          itemBuilder: (context, index){
              return UserTile(name: beverrUsers?.docs[index].get('name'),
                sugar: beverrUsers?.docs[index].get('sugar'),
                strength: beverrUsers?.docs[index].get('strength'),
              );
          },
          physics: const BouncingScrollPhysics(),

      ),
    );
  }
}
