import '../../data/models/getcomment.dart';
import '../repositories/comment_repository.dart';

class GetCommentUseCase {

  final CommentRepository commentRepository;
  GetCommentUseCase(this.commentRepository);
  Future<List<GetCommentModel>> execute(int iduser) async {
    return await commentRepository.getcomment(iduser);
  }
}
