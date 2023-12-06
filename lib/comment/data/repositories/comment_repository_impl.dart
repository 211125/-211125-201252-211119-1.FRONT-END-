

import '../../domain/entities/poshComment.dart';
import '../../domain/repositories/comment_repository.dart';
import '../datasources/comment_data_source.dart';
import '../models/getcomment.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentLocalDataSourceImp commentLocalDataSource;

  CommentRepositoryImpl( {required this.commentLocalDataSource});

  @override
  Future<void> postComment(poshcomment comment)async {
   await commentLocalDataSource.postreaction(comment);
  }

  @override
  Future<List<GetCommentModel>> getcomment(int id) async{
    return  await commentLocalDataSource.getcomment(id);
  }



}
