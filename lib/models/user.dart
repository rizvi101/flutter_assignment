import 'package:flutter/cupertino.dart';

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String imageUrl;
  User({
    this.id,
    @required this.email,
    @required this.firstName,
    @required this.lastName,
    @required this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      imageUrl: json['avatar'],
    );
  }
}
