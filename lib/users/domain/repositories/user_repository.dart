

import '../../data/models/post_user.dart';
import '../entities/userLogin.dart';
import '../entities/usercreate.dart';

abstract class UserRepository{
  Future<void> createUser(UserModel user);
  Future<UserLogin?> postLogin(String email, String password);

}