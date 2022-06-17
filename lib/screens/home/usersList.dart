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
  @override
  Widget build(BuildContext context) {

    final beverrUsers= Provider.of<QuerySnapshot?>(context);
    int len= beverrUsers!.size;
    print(len);
    final userData= (beverrUsers!.docs[0]);
    print(userData.get('name'));
    print(userData.get('sugar'));

    return ListView.builder(
        itemCount: len,
        itemBuilder: (context, index){
          return UserTile(name: beverrUsers.docs[index].get('name'),
                          sugar: beverrUsers.docs[index].get('sugar'),
                          strength: beverrUsers.docs[index].get('strength'),
          );
        }
    );
  }
}
