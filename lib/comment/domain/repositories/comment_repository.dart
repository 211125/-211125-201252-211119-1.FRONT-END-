

import '../../data/models/getcomment.dart';
import '../entities/getcomment.dart';
import '../entities/poshComment.dart';

abstract class CommentRepository{
  Future<void> postComment(poshcomment comment);
  Future<List<GetCommentModel>> getcomment(int iduser);

}