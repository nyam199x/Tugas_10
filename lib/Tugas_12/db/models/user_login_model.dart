import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModelSQL {
  final int? id;
  final String email;
  final String password;
  final String name;
  final String phone;
  final String city;

  UserModelSQL({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.city,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'city': city,
    };
  }

  factory UserModelSQL.fromMap(Map<String, dynamic> map) {
    return UserModelSQL(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
      city: map['city'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelSQL.fromJson(String source) =>
      UserModelSQL.fromMap(json.decode(source) as Map<String, dynamic>);
}
