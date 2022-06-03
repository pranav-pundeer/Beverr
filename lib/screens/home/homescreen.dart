import 'package:beverr/services/auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    AuthService _auth= AuthService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Beverr'),
        actions: [
          FlatButton.icon(icon: Icon(Icons.person), label: Text('sign out'),
              onPressed:() async{
                  await _auth.signOut();
              }),
        ],
      ),
      backgroundColor: Colors.brown[50],
    );
  }
}
