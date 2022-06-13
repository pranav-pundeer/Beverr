import 'package:beverr/models/userModel.dart';
import 'package:beverr/screens/authentication/authenticate.dart';
import 'package:beverr/screens/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final user= Provider.of<UserModel?>(context);
    print(user);

    return user == null? Authenticate(): HomeScreen();
  }
}
