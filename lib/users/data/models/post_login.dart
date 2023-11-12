
import '../../domain/entities/userLogin.dart';
class UserLoginModel extends UserLogin {
  UserLoginModel({
    required String status,
    required String token,
    required int userId,
  }) : super(status: status, token: token, userId: userId);

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      status: json['status'] ?? '',
      token: json['token'] ?? '',
      userId: json['userId'] ?? 0,
    );
  }

  factory UserLoginModel.fromEntity(UserLogin login) {
    return UserLoginModel(
      status: login.status,
      token: login.token,
      userId: login.userId,
    );
  }
}
