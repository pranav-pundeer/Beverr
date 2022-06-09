import 'package:flutter/material.dart';

import '../../services/auth.dart';

class Register extends StatefulWidget {

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
        title: const Center(child: Text('Register To Beverr' )),
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
                child: const Text('Sign Up', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
