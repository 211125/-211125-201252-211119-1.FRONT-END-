

import 'package:flutter_application_1/reaction/data/datasources/reaction_data_source.dart';
import 'package:flutter_application_1/reaction/data/repositories/reaction_repository_impl.dart';
import 'package:flutter_application_1/reaction/domain/usecases/getreaction_usercase.dart';

import 'reaction/domain/usecases/poshreaction_usercase.dart';

class ReactioncaseConfig {
  ReactionLocalDataSourceImp? reactionLocalDataSourceImp;
  ReactionRepositoryImpl? reactionRepositoryImpl;
  PoshReactionUseCase? poshReactionUseCase;
  GetReactionCountUseCase? getReactionCountUseCase;

  ReactioncaseConfig() {
    reactionLocalDataSourceImp = ReactionLocalDataSourceImp();
    reactionRepositoryImpl = ReactionRepositoryImpl(reactionLocalDataSource: reactionLocalDataSourceImp!);
    poshReactionUseCase = PoshReactionUseCase(reactionRepositoryImpl!);
    getReactionCountUseCase = GetReactionCountUseCase(reactionRepositoryImpl!);
  }
}
