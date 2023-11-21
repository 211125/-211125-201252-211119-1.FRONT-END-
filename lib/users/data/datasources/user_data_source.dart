import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/entities/session.dart';
import '../../domain/entities/userLogin.dart';
import '../../domain/entities/usercreate.dart';
import '../models/post_login.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../models/post_user.dart';
import '../models/session_moodel.dart';


abstract class UserLocalDataSource {
  Future<void> createUser(UserModel user);
  Future<Session> postLogin(Login login);

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
  Future<Session> postLogin(Login login) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(LoginModel.fromEntity(login).toJson()),
    );

    if (response.body != null && response.body.isNotEmpty) {
      dynamic body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('session', jsonEncode(body['data']));
        return SessionModel.fromJson(body['data']);
      } else {
        print("error");
        throw Exception(body['error']);
      }
    } else {
      throw Exception("Empty response from server");
    }
  }




}