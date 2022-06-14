import 'package:beverr/constants/loading.dart';
import 'package:flutter/material.dart';
import '../../constants/text.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  const Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  //form key to enable form validation, because we dont want to send
  //empty requests to firebase auth
  final _formkey = GlobalKey<FormState>();
  bool loading= false;
  final AuthService _auth= AuthService();
  String email= "";
  String password= "";
  String errorMessage= "";

  @override
  Widget build(BuildContext context) {
    return loading? const Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        actions: [
          FlatButton.icon(onPressed: (){
            widget.toggleView();
          },
            icon: const Icon(Icons.person),
            label: const Text('Sign In'),),
        ],
        elevation: 0.0,
        backgroundColor: Colors.brown[400],
        title: const Text('Register To Beverr' ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value){
                  return value!.isEmpty? 'email is required': null;
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
                  return value!.length< 6? 'password should be of atleast 6 characters': null;
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
                    dynamic result= await _auth.registerWithMailAndPassword(email, password);
                    if(result== null){
                      setState(()=> errorMessage= 'please enter a valid email');
                      loading= false;
                    }
                  }
                },
                color: Colors.pink,
                child: const Text('Sign Up', style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(height: 15,),
              Text(errorMessage, style: const TextStyle(color: Colors.red,fontSize: 15),),
            ],
          ),
        ),
      ),
    );
  }
}
