import 'dart:convert';

class AccountModel {
  String name;
  String contact;
  String email;
  String password;
  AccountModel({
    required this.name,
    required this.contact,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'f_name': name,
      'phone': contact,
      'email': email,
      'password': password,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      name: map['f_name'] as String,
      contact: map['phone'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
