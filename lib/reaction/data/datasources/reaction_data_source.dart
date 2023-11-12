import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/entities/reaction.dart';
import '../../domain/entities/poshReaction.dart';
import '../models/post_login.dart';



abstract class ReactionLocalDataSource {

  Future<void> postreaction(poshReaction user);
  Future<int> getReactionCount(int id);
}

class ReactionLocalDataSourceImp implements ReactionLocalDataSource {
  final String _baseUrl = 'https://plv3w7fl-3000.usw3.devtunnels.ms';

  @override
  Future<int> getReactionCount(int id) async {
    var response = await http.get(Uri.parse('https://plv3w7fl-3000.usw3.devtunnels.ms/reaction/count/$id'));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse['data']['count'];
    } else {
      throw Exception('Error al obtener el conteo de reacciones');
    }
  }


  @override
  Future<void> postreaction(poshReaction user) async {
    try {
      await http.post(
        Uri.parse('$_baseUrl/add'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'publicationId': user.publicationId,
          'userId': user.userId

        }),
      );
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }
  }


}