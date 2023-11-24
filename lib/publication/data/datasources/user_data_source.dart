import 'dart:convert';


import '../models/getuser_model.dart';

import 'package:http/http.dart' as http;

import '../models/posh_model.dart';



abstract class poshLocalDataSource {
  Future<List<PostModel>> getUsers();
  Future<void> createpublication(createModel user);

  Future<List<PostModel>> getVideo();
  Future<List<PostModel>> getAudio();
  Future<List<PostModel>> getGif();


}

class PoshLocalDataSourceImp implements poshLocalDataSource {
  final String _baseUrl = 'https://211125-201252-211119-backend-production.up.railway.app';

@override
Future<List<PostModel>> getUsers() async {
  try {
    var response = await http.get(Uri.parse('$_baseUrl/publication/images'));
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
    print('Error al obtener img: $e');
    throw e;
  }
}

  @override
  Future<List<PostModel>> getVideo() async {
    try {
      var response = await http.get(Uri.parse('$_baseUrl/publication/videos'));
      if (response.statusCode == 200) {
        List<PostModel> posts = (jsonDecode(response.body) as List)
            .map((post) => PostModel.fromJson(post))
            .toList();

        print(posts);
        return posts;
      } else {
        throw Exception('Failed to load getVideo');
      }
    } catch (e) {
      print('Error al obtener getVideo: $e');
      throw e;
    }
  }

  @override
  Future<List<PostModel>> getAudio() async {
    try {
      var response = await http.get(Uri.parse('$_baseUrl/publication/audios'));
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
      print('Error al obtener getAudio: $e');
      throw e;
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
  Future<List<PostModel>> getPdf() async {
    try {
      var response = await http.get(Uri.parse('$_baseUrl/publication/pdf'));
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
  Future<void> createpublication(createModel user) async {
  final url = '$_baseUrl/publication/publish';

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(url));

  // Add text fields
  request.fields['userId'] = user.userId.toString();
  request.fields['description'] = user.description;
  // Add file
  var pic = await http.MultipartFile.fromPath('multimedia', user.multimedia);
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

}