
import '../entities/poshReaction.dart';
import '../repositories/reaction_repository.dart';

class PoshReactionUseCase{
  final ReactionRepository reactionRepository;

  PoshReactionUseCase(this.reactionRepository);
  Future<void> excute(poshReaction user) async{
    try{
      await reactionRepository.postreaction(user);

    }catch(e,stackTrace){
      print('Error al hacer la reacion: $e');
      print('StackTrace: $stackTrace');
      throw e;
    }
  }
}