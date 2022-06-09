import 'package:beverr/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth= AuthService();
  String email= "";
  String password= "";

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
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter email",
                ),
                onChanged: (value){
                  setState((){
                    email= value;
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter password",
                ),
                onChanged: (value){
                  setState((){
                    password= value;
                  });
                },
              ),
              const SizedBox(height: 30,),
              RaisedButton(
                onPressed: ()async{
                },
                color: Colors.pink,
                child: const Text('Sign In', style: TextStyle(color: Colors.white),),
                ),
            ],
          ),

        ),
      ),
    );
  }
}
