import '../../domain/entities/session.dart';

class SessionModel extends Session {
  SessionModel({
     String? status,
     String? token,
     int? userId,
  }): super(status: status, token: token, userId: userId);

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    if (json == null || json['data'] == null) {
      throw Exception("Invalid response format");
    }
    return SessionModel(
      status: json['data']['status'] ?? '',
      token: json['data']['token'] ?? '',
      userId: json['data']['userId'] ?? 0,
    );
  }


  factory SessionModel.fromEntity(Session session) {
    return SessionModel(
      status: session.status,
      userId: session.userId,
      token: session.token,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'token': token,
      'userId':userId,

    };
  }
}