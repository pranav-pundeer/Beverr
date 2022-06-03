import 'package:beverr/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth= AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown[400],
        title: const Center(child: Text('Hi! Let\'s get you signed in' )),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: RaisedButton(
          child: const Text('Sign In Anonymously'),
          onPressed: ()async{
            dynamic user= await _auth.signInAnonymously();
            if(user == null){
              print(null);
            }else{
              print('sign in complete');
              print(user.uid);
            }
          },
        ),
      ),
    );
  }
}
