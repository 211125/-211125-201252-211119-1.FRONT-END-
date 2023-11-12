

import '../entities/reaction.dart';
import '../entities/poshReaction.dart';

abstract class ReactionRepository{
  Future<void> postreaction(poshReaction user);
  Future<int> getReactionCount(int id);}