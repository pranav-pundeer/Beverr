import 'package:beverr/screens/authentication/register.dart';
import 'package:beverr/screens/authentication/signIn.dart';
import 'package:flutter/material.dart';


class Authenticate extends StatefulWidget {

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn= true;

  void toggleView(){
    setState((){
      showSignIn= !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (showSignIn? SignIn(toggleView: toggleView,): Register(toggleView: toggleView));
  }
}
