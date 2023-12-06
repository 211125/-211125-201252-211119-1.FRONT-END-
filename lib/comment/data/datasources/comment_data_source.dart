import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/entities/getcomment.dart';
import '../../domain/entities/poshComment.dart';
import '../models/getcomment.dart';
import '../models/post_comment.dart';



abstract class CommentLocalDataSource {

  Future<void> postreaction(poshcomment comment);
  Future<List<GetCommentModel>> getcomment(int iduser);

}

class CommentLocalDataSourceImp implements CommentLocalDataSource {
  final String _baseUrl = 'https://211125-201252-211119-backend-production.up.railway.app';





  @override
  Future<void> postreaction(poshcomment comment) async {
    try {
      await http.post(
        Uri.parse('$_baseUrl/comment/publication/${comment.publicationId}/usercomment/${comment.userId}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'content': comment.content,


        }),
      );
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }
  }

  @override
  Future<List<GetCommentModel>> getcomment(int iduser) async {
    var url = Uri.parse('$_baseUrl/comment/user/${iduser}/comments');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<GetCommentModel> comments = [];
      for (var commentJson in jsonResponse) {
        comments.add(GetCommentModel.fromJson(commentJson));
      }
      print('comments $comments');

      return comments;
    } else {
      throw Exception('Error al obtener los comentarios');
    }
  }






}