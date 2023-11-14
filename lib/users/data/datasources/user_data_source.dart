import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/entities/userLogin.dart';
import '../../domain/entities/usercreate.dart';
import '../models/post_login.dart';


import '../models/post_user.dart';


abstract class UserLocalDataSource {
  Future<void> createUser(UserModel user);
  Future<UserLogin?> postLogin(String email, String password);

}

class UserLocalDataSourceImp implements UserLocalDataSource {
  final String _baseUrl = 'http://192.168.1.73:3000';
  //  Future<void> createUser(UserModel user) async {
  @override
  Future<void> createUser(UserModel user) async {
    final url = '$_baseUrl/user/create';

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Add text fields
    request.fields['name'] = user.name;
    request.fields['last_name'] = user.last_name;
    request.fields['email'] = user.gmail;
    request.fields['password'] = user.password;

    // Add file
    var pic = await http.MultipartFile.fromPath('profilePicture', user.profilePicture);
    request.files.add(pic);

    // Send the request
    var response = await request.send();
    if (response.statusCode == 201) {
      print('User created successfully');
    } else {
      print('Failed to create user');
      print('Status code: ${response.statusCode}');
      print('Response body: ${await response.stream.bytesToString()}');
      throw Exception('Failed to create user');
    }

  }
  @override
  Future<UserLogin?> postLogin(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
        UserLoginModel user = UserLoginModel.fromJson(jsonDecode(response.body));
        print('Decoded user: $user');
        return user;
      } else {
        print('Response body error: ${response.body}');
        throw Exception('Failed to load user: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load user: $e');
    }
  }



}