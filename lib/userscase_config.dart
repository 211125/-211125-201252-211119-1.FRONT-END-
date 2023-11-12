
import 'package:flutter_application_1/users/data/datasources/user_data_source.dart';
import 'package:flutter_application_1/users/data/repositories/user_repository_impl.dart';

import 'users/domain/usecases/poshcreate_usercase.dart';
import 'users/domain/usecases/poshlogin_usercase.dart';

class UsercaseConfig {
  UserLocalDataSourceImp? userLocalDataSourceImp;
  UserRepositoryImpl? userRepositoryImpl;
  PoshCreateUsersUseCase? poshCreateUsersUseCase;
  LoginUser? loginUser;

  UsercaseConfig() {
    userLocalDataSourceImp = UserLocalDataSourceImp();
    userRepositoryImpl = UserRepositoryImpl(userLocalDataSource: userLocalDataSourceImp!);
    poshCreateUsersUseCase = PoshCreateUsersUseCase(userRepositoryImpl!);
    loginUser = LoginUser(userRepositoryImpl!);
  }
}
