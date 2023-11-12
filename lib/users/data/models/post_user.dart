import 'dart:io';
import '../../domain/entities/usercreate.dart';

class UserModel extends UserCreate {
  UserModel({
    required String name,
    required String last_name,
    required String gmail,
    required String password,
   required String filePath,
  }) : super(
    name: name,
    last_name: last_name,
    gmail: gmail,
    password: password,
    profilePicture: filePath,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    if (json['profilePicture'] ) {
      throw Exception('Profile picture is missing or null');
    }
    return UserModel(
      name: json['name'] ?? '',
      last_name: json['last_name'] ?? '',
      gmail: json['email'] ?? '',
      password: json['password'] ?? '',
      filePath: json['filePath'] ?? '',
    );
  }

  factory UserModel.fromEntity(UserCreate user) {
    return UserModel(
      name: user.name,
      last_name: user.last_name,
      gmail: user.gmail,
      password: user.password,
      filePath: user.profilePicture,
    );
  }
}
