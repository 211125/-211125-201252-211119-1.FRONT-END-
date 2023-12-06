


import '../../domain/entities/getcomment.dart';

class GetCommentModel extends getComment {

  GetCommentModel({
    required int id,
    required int userId,
    required int publicationId,
    required String content,
    required String userName,
  }) : super(id: id,userId:userId,publicationId:publicationId,content:content,userName:userName);


  factory GetCommentModel.fromJson(Map<String, dynamic> json) {
    return GetCommentModel(
      id: json['id'] ?? 0,
      userId:  json['userId'] ?? 0,
      publicationId:  json['userId'] ?? 0,
      content: json['content'] ?? '',
      userName: json['userName'] ?? '',


    );
  }

  factory GetCommentModel.fromEntity(getComment reaction) {
    return GetCommentModel(
      id: reaction.id,
      userId: reaction.userId,
      publicationId: reaction.publicationId,
      content: reaction.content,
      userName: reaction.userName


    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'description': publicationId,
      'multimedia': content,
      'userProfile':userName
    };
  }
}
