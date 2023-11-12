import '../../domain/entities/Postcreate.dart';
class createModel extends Postcreate {

  createModel({
    required int userId,
    required String description,
    required String filePath
  }) : super(userId:userId, description: description, multimedia: filePath );


  factory createModel.fromJson(Map<String, dynamic> json) {
    if (json['multimedia'] ) {
      throw Exception('Profile picture is missing or null');
    }
    return createModel(
      userId: json['userId'] ?? 0 ,
      description: json['description'] ?? '',
      filePath: json['multimedia'] ?? '',

    );
  }

  factory createModel.fromEntity(Postcreate post) {
    return createModel(
      userId: post.userId,
      description: post.description,
      filePath: post.multimedia,
    );
  }
}
