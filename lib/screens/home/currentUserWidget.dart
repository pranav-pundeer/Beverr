import 'package:beverr/screens/home/preferenceForm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/userModel.dart';
import '../../services/database.dart';
 class CurrentUserWidget extends StatefulWidget {
   const CurrentUserWidget({Key? key}) : super(key: key);

   @override
   State<CurrentUserWidget> createState() => _CurrentUserWidgetState();
 }

 class _CurrentUserWidgetState extends State<CurrentUserWidget> {
   @override
   Widget build(BuildContext context) {


     void showBottomSheetPanel(){
       showModalBottomSheet(context: context, builder: (context){
         return Flexible(
           child: Container(
             height: (MediaQuery.of(context).size.height) / 1.75,
             child: const Padding(
               padding: EdgeInsets.only(top:25.0),
               child: PreferenceForm(),
             ),
           ),
         );
       });
     }

     final user= Provider.of<UserModel?>(context);

     return StreamBuilder<UserDataModel>(
       stream: DataBase(uid: user!.uid).userData,
       builder: (context, snapshot) {
         if (snapshot.hasData) {
           UserDataModel? userData = snapshot.data;
           return Container(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 decoration: BoxDecoration(
                   color: Colors.grey.withOpacity(0.6),
                   borderRadius: BorderRadius.all(Radius.circular(20)),
                 ),
                 height: 100,
                 child: ListTile(
                   leading: CircleAvatar(
                     backgroundImage: AssetImage('images/coffee_icon.png'),
                     radius: 29,
                     backgroundColor: Colors.brown[userData!.strength],
                   ),
                   trailing: ElevatedButton.icon(icon: const Icon(Icons.edit),
                       onPressed: () {
                         showBottomSheetPanel();
                       },
                     label: Text(''),
                     style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all(Colors.brown),
                     ),
                   ),
                   title: Text(userData.name),
                   subtitle: Text('Takes ${userData.sugar} sugar(s)'),
                 ),
               ),
             ),
           );
         } else {
            return SizedBox(width: 0,);
         }
       }
     );
   }
 }


