

import '../../domain/entities/poshComment.dart';

class poshCommentModel extends poshcomment {

  poshCommentModel({
     int? publicationId,
     int? userId,
  required String content
  }) : super(publicationId: publicationId, userId: userId,content:content);


  factory poshCommentModel.fromJson(Map<String, dynamic> json) {
    return poshCommentModel(
      publicationId: json['publicationId'] ?? 0,
      userId: json['userId'] ?? 0,
        content: json['content']?? ''
    );
  }

  factory poshCommentModel.fromEntity(poshcomment reaction) {
    return poshCommentModel(
      publicationId: reaction.publicationId,
      userId: reaction.userId,
      content: reaction.content
    );
  }
}
