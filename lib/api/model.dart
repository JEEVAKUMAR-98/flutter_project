class UserModel {
  final int id;
  final String name;
  final String email;

 UserModel({required this.id, required this.name, required this.email});

 factory UserModel.fromjson(Map<String, dynamic> json){
     return UserModel(
      id: json["id"],
      name: json["naame"],
      email: json ["email"]
      );
  }
}
