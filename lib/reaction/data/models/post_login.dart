

import '../../domain/entities/poshReaction.dart';

class ReactionModel extends poshReaction {

  ReactionModel({
    required String publicationId,
    required String userId,
  }) : super(publicationId: publicationId, userId: userId);


  factory ReactionModel.fromJson(Map<String, dynamic> json) {
    return ReactionModel(
      publicationId: json['publicationId'] ?? '',
      userId: json['userId'] ?? '',

    );
  }

  factory ReactionModel.fromEntity(poshReaction reaction) {
    return ReactionModel(
      publicationId: reaction.publicationId,
      userId: reaction.userId,
    );
  }
}
