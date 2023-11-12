


import '../../domain/entities/reaction.dart';

class GetReactionModel extends getReaction {

  GetReactionModel({
    required int count,
  }) : super(count: count);


  factory GetReactionModel.fromJson(Map<String, dynamic> json) {
    return GetReactionModel(
      count: json['publicationId'] ?? 0,


    );
  }

  factory GetReactionModel.fromEntity(GetReactionModel reaction) {
    return GetReactionModel(
      count: reaction.count,

    );
  }
}
