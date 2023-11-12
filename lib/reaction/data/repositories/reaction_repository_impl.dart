import 'package:flutter_application_1/reaction/domain/entities/poshReaction.dart';
import '../../domain/repositories/reaction_repository.dart';
import '../datasources/reaction_data_source.dart';

class ReactionRepositoryImpl implements ReactionRepository {
  final ReactionLocalDataSource reactionLocalDataSource;

  ReactionRepositoryImpl( {required this.reactionLocalDataSource});



  @override
  Future<void> postreaction(poshReaction user)async {
   await reactionLocalDataSource.postreaction(user);
  }

  @override
  Future<int> getReactionCount(int id)async => await reactionLocalDataSource.getReactionCount(id);



}
