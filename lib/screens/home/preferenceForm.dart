import 'package:beverr/constants/loading.dart';
import 'package:beverr/constants/text.dart';
import 'package:beverr/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/userModel.dart';

class PreferenceForm extends StatefulWidget {
  const PreferenceForm({Key? key}) : super(key: key);

  @override
  State<PreferenceForm> createState() => _PreferenceFormState();
}

class _PreferenceFormState extends State<PreferenceForm> {

  final _formKey= GlobalKey<FormState>();
  final List<String> sugars= ['0', '1', '2', '3', '4'];
  final email = FirebaseAuth.instance.currentUser?.email;

  String? currentName;
  String? currentSugar;
  int? currentStrength;
  String? username;

  @override
  Widget build(BuildContext context) {

    final user= Provider.of<UserModel?>(context);

    return StreamBuilder<UserDataModel>(
      stream: DataBase(uid: user!.uid).userData,
      builder: (context, snapshot) {

            if(snapshot.hasData){
              UserDataModel? userData= snapshot.data;

              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: const Text('Update Preferences', style: TextStyle(fontSize: 20),),),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFormField(
                        initialValue: userData?.name,
                        decoration: textFieldDecoration.copyWith(hintText: 'enter name'),
                        validator: (val){
                          val!.isEmpty? 'please enter a name': null;
                        },
                        onChanged: (val)=> setState((){
                          currentName= val;
                        }),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: DropdownButtonFormField(
                        decoration: textFieldDecoration.copyWith(hintText: 'enter the number of sugars'),
                        value: currentSugar?? userData?.sugar,
                        items: sugars.map((sugar) {
                          return DropdownMenuItem(
                            value: sugar,
                            child: Text('$sugar sugars'),
                          );
                        }).toList(),
                        onChanged: (sugar)=> setState((){
                          currentSugar= sugar as String?;
                        }),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Slider(
                      min: 100,
                      max: 900,
                      divisions: 8,
                      activeColor: Colors.brown[currentStrength?? userData!.strength],
                      inactiveColor: Colors.brown[100],
                      value: (currentStrength?? userData?.strength)!.toDouble(),
                      onChanged: (val)=> setState(()=> currentStrength= val.round()),
                    ),

                    const SizedBox(height: 5,),
                    //slider
                    const Center(child: Text('set coffee strength',)),
                    const SizedBox(height: 65,),
                    Center(
                      child: RaisedButton(
                          shape: const StadiumBorder(),
                          color: Colors.brown,
                          child: const Text('Update', style: TextStyle(color: Colors.white),),
                          onPressed: () async{
                            if(_formKey.currentState!.validate()){
                              await DataBase(uid: user.uid).updateUserData(
                              currentSugar?? userData!.sugar,
                              currentName?? userData!.name,
                              currentStrength ?? userData!.strength,
                              email?? userData!.email,
                              userData!.organization);
                              Navigator.pop(context);
                            }
                          }),
                    ),
                  ],
                ),
              );
            }else{
                return const Loading();
            }
      }
    );
  }
}

