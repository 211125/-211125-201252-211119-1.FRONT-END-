

import 'package:flutter_application_1/users/domain/entities/userLogin.dart';

import '../repositories/user_repository.dart';

class LoginUser{
  final UserRepository userRepository;
  LoginUser(this.userRepository);
  Future<UserLogin?> excute(String email, String password)async{
    try{
    final authUser = await userRepository.postLogin(email, password);
    return authUser;
    }catch(e){
     // print('error en el login xd $e');
      return null;
    }
  }
}