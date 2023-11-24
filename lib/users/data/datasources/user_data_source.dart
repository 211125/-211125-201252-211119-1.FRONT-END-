import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/entities/session.dart';
import '../../domain/entities/userLogin.dart';
import '../../domain/entities/usercreate.dart';
import '../models/post_login.dart';
//import 'package:shared_preferences/shared_preferences.dart';


import '../models/post_user.dart';
import '../models/session_moodel.dart';


abstract class UserLocalDataSource {
  Future<void> createUser(UserModel user);
  Future<Session> postLogin(Login login);

}

class UserLocalDataSourceImp implements UserLocalDataSource {
  final String _baseUrl = 'https://211125-201252-211119-backend-production.up.railway.app';
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
    final Uri url = Uri.parse('$_baseUrl/login/login');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': login.email,
        'password': login.password,
      }),
    );

    if (response.statusCode != 200) {
          print('Failed to create user${response.statusCode}');

          throw Exception('correo o contraseña incorrectos');
    }

    final body = jsonDecode(response.body);
    if (body == null) {
      throw Exception('Invalid or missing data in response');
    }

    // No es necesario buscar la clave 'data', directamente podemos acceder a los campos
    String status = body['status'];
    String token = body['token'];
    int userId = body['userId'];

    if (status == null || token == null || userId == null) {
      throw Exception('Missing required fields in response');
    }


    return SessionModel(status: status, token: token, userId: userId);
  }

}




