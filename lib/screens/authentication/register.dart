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
  String username= "";

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/coffee_register.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Form(
            key: _formkey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(child: SizedBox(height: 50,)),
                const Flexible(
                  child: Center(child: Text('Hi! Let\'s get you onboard' ,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white60,
                          fontWeight: FontWeight.bold,
                          fontSize: 40))),
                ),
                const Flexible(
                  child: Center(child: Text('Beverr',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 60))),
                ),
                const SizedBox(height: 10,),
                Flexible(
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(width: 90,),
                        const Center(child: Text('Already a user? ',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,
                                fontSize: 20))),
                        FlatButton(onPressed: (){
                          widget.toggleView();
                        }, child: const Text('Sign In', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),))
                      ],
                    ),
                  ),
                ),

                Flexible(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.75,
                      child: TextFormField(
                        validator: (value){
                          return (value!.isEmpty? 'username cannot be empty': null);
                        },
                        obscureText: false,
                        decoration: textFieldDecoration.copyWith(hintText: 'Enter username', enabledBorder: InputBorder.none, focusedBorder: InputBorder.none,),
                        onChanged: (value){
                          setState((){
                            username= value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                //const SizedBox(height: 20,),
                Flexible(
                  child: Align(  
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.75,
                      child: TextFormField(
                        validator: (value){
                          return (value!.isEmpty? 'please enter a valid email': null);
                        },
                        decoration: textFieldDecoration.copyWith(hintText: 'Enter email', enabledBorder: InputBorder.none, focusedBorder: InputBorder.none, ),
                        onChanged: (value){
                          setState((){
                            email= value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                //const SizedBox(height: 20,),
                Flexible(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.75,
                      child: TextFormField(
                        validator: (value){
                          return (value!.length<6? 'please enter a valid password (atleast 6 characters long)': null);
                        },
                        obscureText: true,
                        decoration: textFieldDecoration.copyWith(hintText: 'Enter password', enabledBorder: InputBorder.none, focusedBorder: InputBorder.none,),
                        onChanged: (value){
                          setState((){
                            password= value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                //const SizedBox(height: 30,),
                const Spacer(),

                Flexible(
                  child: Container(
                    height: 60,
                    width: 300,
                    child: RaisedButton(
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      shape: StadiumBorder(),
                      onPressed: ()async{
                          if(_formkey.currentState!.validate()){
                            setState(()=>loading= true);
                            dynamic result= await _auth.registerWithMailAndPassword(email, password, username);
                            if(result== null){
                              setState(()=> errorMessage= 'please enter a valid email');
                              loading= false;
                            }
                          }
                      },
                      color: Colors.brown[500],
                      child: const Text('Take me to Beverr', style: TextStyle(color: Colors.white, ),),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Text(errorMessage,style: const TextStyle(color: Colors.pink),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// RaisedButton(
// onPressed: ()async{
// if(_formkey.currentState!.validate()){
// setState(()=>loading= true);
// dynamic result= await _auth.registerWithMailAndPassword(email, password);
// if(result== null){
// setState(()=> errorMessage= 'please enter a valid email');
// loading= false;
// }
// }
// },
// color: Colors.pink,
// child: const Text('Sign Up', style: TextStyle(color: Colors.white),),
// ),
