class UserModel{
  final String uid;
  UserModel({required this.uid});
}

class UserDataModel {
  final String uid;
  final String name;
  final String sugar;
  final int strength;
  final String email;

  UserDataModel({required this.uid, required this.name, required this.sugar, required this.strength, required this.email});
}