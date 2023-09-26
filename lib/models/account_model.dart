import 'dart:convert';

class AccountModel {
  int id;
  String name;
  String contact;
  String email;
  String password;
  int orderCount;
  AccountModel({
    this.id = 0,
    required this.name,
    required this.contact,
    required this.email,
    required this.password,
    this.orderCount = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order_count': orderCount,
      'f_name': name,
      'phone': contact,
      'email': email,
      'password': password,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'] as int,
      name: map['f_name'] as String,
      contact: map['phone'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      orderCount: map['order_count'] as int,
    );
  }

  String toJson() => json.encode(toMap());
}
