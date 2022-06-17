import 'package:beverr/screens/home/usersList.dart';
import 'package:beverr/services/auth.dart';
import 'package:beverr/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    AuthService auth= AuthService();

    return StreamProvider<QuerySnapshot?>.value(
      value: DataBase().beverrUsersData,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: const Text('Beverr'),
          actions: [
            FlatButton.icon(icon: const Icon(Icons.person), label: const Text('sign out'),
                onPressed:() async{
                    await auth.signOut();
              },
            ),
          ],
        ),
        backgroundColor: Colors.brown[50],
        body: UsersList(),
      ),
    );
  }
}
