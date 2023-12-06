
import '../entities/poshComment.dart';
import '../repositories/comment_repository.dart';

class PoshcommentUseCase{
  final CommentRepository reactionRepository;

  PoshcommentUseCase(this.reactionRepository);
  Future<void> excute(poshcomment comment) async{
    try{
      await reactionRepository.postComment(comment);

    }catch(e,stackTrace){
      print('Error al hacer la reacion: $e');
      print('StackTrace: $stackTrace');
      throw e;
    }
  }
}