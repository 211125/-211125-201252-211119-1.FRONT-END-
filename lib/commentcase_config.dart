


import 'comment/data/datasources/comment_data_source.dart';
import 'comment/data/repositories/comment_repository_impl.dart';
import 'comment/domain/usecases/getcomment_usercase.dart';
import 'comment/domain/usecases/poshComment_usercase.dart';

class CommentcaseConfig {

  CommentLocalDataSourceImp? commentLocalDataSourceImp;
  CommentRepositoryImpl? commentRepositoryImpl;
  PoshcommentUseCase? poshcommentUseCase;
  GetCommentUseCase? getCommentUseCase;
  CommentcaseConfig() {
    commentLocalDataSourceImp = CommentLocalDataSourceImp();
    commentRepositoryImpl = CommentRepositoryImpl(commentLocalDataSource: commentLocalDataSourceImp! );
    poshcommentUseCase = PoshcommentUseCase(commentRepositoryImpl!);
    getCommentUseCase= GetCommentUseCase(commentRepositoryImpl!);


  }
}
