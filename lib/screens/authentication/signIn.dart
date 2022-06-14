import 'package:beverr/constants/loading.dart';
import 'package:beverr/services/auth.dart';
import 'package:flutter/material.dart';

import '../../constants/text.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth= AuthService();
  String email= "";
  String password= "";
  String error= "";
  final _formkey = GlobalKey<FormState>();
  bool loading= false;


  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        actions: [
          FlatButton.icon(onPressed: (){
            widget.toggleView();
          },
            icon: const Icon(Icons.person),
            label: const Text('Register'),),
        ],
        elevation: 0.0,
        backgroundColor: Colors.brown[400],
        title: const Text('Hi! Let\'s get you signed in' ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value){
                  return (value!.isEmpty? 'please enter a valid email': null);
                },
                decoration: textFieldDecoration.copyWith(hintText: 'Enter email'),
                onChanged: (value){
                  setState((){
                    email= value;
                  });
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                validator: (value){
                  return (value!.length<6? 'please enter a valid password (atleast 6 characters long)': null);
                },
                obscureText: true,
                decoration: textFieldDecoration.copyWith(hintText: 'Enter password'),
                onChanged: (value){
                  setState((){
                    password= value;
                  });
                },
              ),
              const SizedBox(height: 30,),
              RaisedButton(
                onPressed: ()async{
                  if(_formkey.currentState!.validate()){
                    setState(()=>loading= true);
                    dynamic result= await _auth.signInWithEmailAndPassword(email, password);
                    if(result== null){
                      setState((){
                        error= 'couldn\'t sign in with those credentials';
                        loading= false;
                      });
                    }
                  }
                },
                color: Colors.pink,
                child: const Text('Sign In', style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(height: 15,),
              Text(error,style: TextStyle(color: Colors.pink),),
            ],
          ),
        ),
      ),
    );
  }
}
