import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';

import '../models/getuser_model.dart';

import 'package:http/http.dart' as http;

import '../models/posh_model.dart';



abstract class poshLocalDataSource {
  Future<List<PostModel>> getUsers(bool coneccion);
  Future<void> createpublication(createModel user,bool coneccion);

  Future<List<PostModel>> getVideo(bool coneccion);
  Future<List<PostModel>> getAudio(bool coneccion);
  Future<List<PostModel>> getGif();


}

class PoshLocalDataSourceImp implements poshLocalDataSource {
  final String _baseUrl = 'https://211125-201252-211119-backend-production.up.railway.app';

@override
Future<List<PostModel>> getUsers(bool coneccion) async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var response;
  var body;
  bool success = false;
  print(coneccion);

  if (coneccion) {
    var url = '$_baseUrl/publication/images';
    print("Obteniendo videos");
    response = await http.get(Uri.parse(url));

    body = jsonDecode(response.body);
    print(body);

    if (response.statusCode == 200) {
      success = true;
    }
  } else {
    String postsString = sharedPreferences.getString('posts') ?? "[]";
    body = jsonDecode(postsString);
    success = true;
  }

  if (success) {
    List<PostModel> posts = body.map<PostModel>(
            (post) => PostModel.fromJson(post)
    ).toList();
    sharedPreferences.setString('posts', jsonEncode(posts));

    return posts;
  } else {
    throw Exception('Failed to load imagen');
  }
}

  @override
  Future<List<PostModel>> getVideo(bool coneccion) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response;
    var body;
    bool success = false;
    print(coneccion);

    if (coneccion) {
      var url = '$_baseUrl/publication/videos';
      print("Obteniendo videos");
      response = await http.get(Uri.parse(url));

      body = jsonDecode(response.body);
      print(body);

      if (response.statusCode == 200) {
        success = true;
      }
    } else {
      String postsString = sharedPreferences.getString('posts') ?? "[]";
      body = jsonDecode(postsString);
      success = true;
    }

    if (success) {
      List<PostModel> posts = body.map<PostModel>(
              (post) => PostModel.fromJson(post)
      ).toList();
      sharedPreferences.setString('posts', jsonEncode(posts));

      return posts;
    } else {
      throw Exception('Failed to load getVideo');
    }
  }


  @override
  Future<List<PostModel>> getAudio(bool coneccion) async {


    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response;
    var body;
    bool success = false;
    print(coneccion);

    if (coneccion) {
      var url = '$_baseUrl/publication/audios';
      print("Obteniendo videos");
      response = await http.get(Uri.parse(url));

      body = jsonDecode(response.body);
      print(body);

      if (response.statusCode == 200) {
        success = true;
      }
    } else {
      String postsString = sharedPreferences.getString('posts') ?? "[]";
      body = jsonDecode(postsString);
      success = true;
    }

    if (success) {
      List<PostModel> posts = body.map<PostModel>(
              (post) => PostModel.fromJson(post)
      ).toList();
      sharedPreferences.setString('posts', jsonEncode(posts));

      return posts;
    } else {
      throw Exception('Failed to load audio');
    }
  }
  @override
  Future<List<PostModel>> getGif() async {
    try {
      var response = await http.get(Uri.parse('$_baseUrl/publication/gif'));
      if (response.statusCode == 200) {
        List<PostModel> posts = (jsonDecode(response.body) as List)
            .map((post) => PostModel.fromJson(post))
            .toList();

        print(posts);
        return posts;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error al obtener getGif: $e');
      throw e;
    }
  }

  @override
  Future<List<PostModel>> getPdf(bool coneccion) async {
  ///publication/pdf
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response;
    var body;
    bool success = false;
    print(coneccion);

    if (coneccion) {
      var url = '$_baseUrl/publication/pdf';
      print("Obteniendo pdf");
      response = await http.get(Uri.parse(url));

      body = jsonDecode(response.body);
      print(body);

      if (response.statusCode == 200) {
        success = true;
      }
    } else {
      String postsString = sharedPreferences.getString('posts') ?? "[]";
      body = jsonDecode(postsString);
      success = true;
    }

    if (success) {
      List<PostModel> posts = body.map<PostModel>(
              (post) => PostModel.fromJson(post)
      ).toList();
      sharedPreferences.setString('posts', jsonEncode(posts));

      return posts;
    } else {
      throw Exception('Failed to load pdf');
    }
  }

  @override
  Future<void> createpublication(createModel user, bool coneccion) async {
    if (coneccion) {
      final url = '$_baseUrl/publication/publish';

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['userId'] = user.userId.toString();
      request.fields['description'] = user.description;

      var pic = await http.MultipartFile.fromPath('multimedia', user.multimedia);
      request.files.add(pic);

      try {
        var response = await request.send();
        if (response.statusCode == 201) {
          print('User created successfully');
        } else {
          print('Failed to create user');
          print('Status code: ${response.statusCode}');
          print('Response body: ${await response.stream.bytesToString()}');
          throw Exception('Failed to create user');
        }
      } catch (error) {
        print('Error sending data to API: $error');
        // Puedes manejar el error según tus necesidades
      }
    } else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String>? storedData = prefs.getStringList('pendingPublications');
        if (storedData == null) {
          storedData = [];
        }

        // Convierte el modelo a una representación de cadena (puedes ajustar esto según tus necesidades)
        String userData = '${user.userId},${user.description},${user.multimedia}';
        storedData.add(userData);

        await prefs.setStringList('pendingPublications', storedData);
        print('Data saved to SharedPreferences');
      } catch (error) {
        print('Error saving data to SharedPreferences: $error');
        // Puedes manejar el error según tus necesidades
      }    }
  }


}