
import '../../data/models/post_user.dart';
import '../entities/usercreate.dart';
import '../repositories/user_repository.dart';

class PoshCreateUsersUseCase{
  final UserRepository userRepository;

  PoshCreateUsersUseCase(this.userRepository);
  Future<void> excute(UserModel user) async{
    try{
      await userRepository.createUser(user);

    }catch(e,stackTrace){
      print('Error al crear el usuario: $e');
      print('StackTrace: $stackTrace');
      throw e;
    }
  }
}