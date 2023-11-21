

import '../../data/models/post_user.dart';
import '../entities/session.dart';
import '../entities/userLogin.dart';
import '../entities/usercreate.dart';

abstract class UserRepository{
  Future<void> createUser(UserModel user);
  Future <Session> postLogin(Login login);

}