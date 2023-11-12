import 'package:flutter_application_1/users/domain/entities/userLogin.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_data_source.dart';
import '../models/post_user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl( {required this.userLocalDataSource});

  @override
  Future<void> createUser(UserModel user) async {
    await userLocalDataSource.createUser(user);
  }

  @override
  Future<UserLogin?> postLogin(String email, String password) async{
    await userLocalDataSource.postLogin(email, password);
  }


}
