
import '../../domain/entities/userLogin.dart';

class LoginModel extends Login {
  LoginModel({
    required String email,
    required String password,
  }): super (email: email, password: password);


  factory LoginModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw Exception("JSON is null");
    }
    return LoginModel(
      email: json['email']?? '',
      password: json['password']?? '',
    );
  }

  factory LoginModel.fromEntity(Login login){
    return LoginModel(
        email: login.email,
        password: login.password
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'email': email,
      'password': password,
    };
  }
}
