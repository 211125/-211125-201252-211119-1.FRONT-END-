import '../repositories/reaction_repository.dart';

class GetReactionCountUseCase {
  final ReactionRepository reactionRepository;

  GetReactionCountUseCase(this.reactionRepository);

  Future<int> execute(int id) async {
    try {
      return await reactionRepository.getReactionCount(id);
    } catch (e, stackTrace) {
      print('Error al obtener el conteo de reacciones: $e');
      print('StackTrace: $stackTrace');
      throw e;
    }
  }
}
