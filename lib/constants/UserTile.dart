import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  // final int flag;
  final String? name;
  final String? sugar;
  final int? strength;
  const UserTile({this.name, this.sugar, this.strength});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          // color: flag== 1? Colors.brown[200]: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListTile(
           leading: CircleAvatar(
             backgroundImage: AssetImage('images/coffee_icon.png'),
             radius: 29,
             backgroundColor: Colors.brown[strength!],
           ),
            title: Text(name!),
            subtitle: Text('Takes ${sugar!} sugar(s)'),
          ),
        ),
      ),
    );
  }
}
