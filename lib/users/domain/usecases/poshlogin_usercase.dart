

import 'package:flutter_application_1/users/domain/entities/userLogin.dart';

import '../entities/session.dart';
import '../repositories/user_repository.dart';

class LoginUser{
  final UserRepository userRepository;
  LoginUser(this.userRepository);
  Future<Session> excute(Login login)async{
    return await userRepository.postLogin(login);
  }
}