import 'package:beverr/screens/home/preferenceForm.dart';
import 'package:beverr/screens/home/usersList.dart';
import 'package:beverr/services/auth.dart';
import 'package:beverr/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/userModel.dart';
import 'currentUserWidget.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    final userData = Provider.of<UserDataModel?>(context);
    AuthService auth = AuthService();

    return StreamProvider<QuerySnapshot?>.value(
      value: DataBase(uid: user!.uid).beverrUsersData,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: const Text('Beverr'),
          actions: [
            FlatButton.icon(
              icon: const Icon(Icons.logout), label: const Text('sign out'),
              onPressed: () async {
                await auth.signOut();
              },
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
          child: ListView(
            children: const [
              CurrentUserWidget(),
              Divider(thickness: 2),
              UsersList(),
            ],
          ),
        ),
      ),
    );
  }
//     return StreamBuilder<QuerySnapshot>(
//         stream: DataBase(uid: user!.uid).beverrUsersData,
//         builder: (context, snapshot){
//           if (snapshot.hasData){
//               return Scaffold(
//                 appBar: AppBar(
//                   backgroundColor: Colors.brown[400],
//                   elevation: 0.0,
//                   title: const Text('Beverr'),
//                   actions: [
//                     FlatButton.icon(icon: const Icon(Icons.logout), label: const Text('sign out'),
//                       onPressed:() async{
//                       await auth.signOut();
//                       },
//                     ),
//                   ],
//                 ),
//                 backgroundColor: Colors.brown[50],
//                 body: Container(
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('images/coffee_bg.png'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: ListView(
//                     children:const [
//                       CurrentUserWidget(),
//                       Divider(thickness: 2),
//                       UsersList(),
//                     ],
//                   ),
//                 ),
//               );
//           }
//           else{
//
//           }
//         }
//
//     );
//   }
// }
}
