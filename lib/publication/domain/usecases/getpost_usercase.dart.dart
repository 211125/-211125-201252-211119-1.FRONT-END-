

import '../../data/models/getuser_model.dart';
import '../repositories/user_repository.dart';

class GetpostUseCase {

  final PoshRepository poshRepository;
  GetpostUseCase(this.poshRepository);
  Future<List<PostModel>> execute(bool coneccion) async {
      return await poshRepository.getUsers( coneccion);
  }
}