import 'package:beverr/screens/home/preferenceForm.dart';
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

    void showBottomSheetPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Flexible(
          child: Container(
            height: (MediaQuery.of(context).size.height) / 1.75,
            child: const Padding(
              padding: EdgeInsets.only(top:25.0),
              child: PreferenceForm(),
            ),
          ),
        );
      });
    }

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
            FlatButton.icon(icon: const Icon(Icons.edit), label: const Text('edit'),
              onPressed: () {
                showBottomSheetPanel();
              }
              ),
          ],
        ),
        backgroundColor: Colors.brown[50],
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/coffee_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: const UsersList(),
        ),
      ),
    );
  }
}
