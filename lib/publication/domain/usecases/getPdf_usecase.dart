import '../../data/models/getuser_model.dart';
import '../repositories/user_repository.dart';

class GetpdfUseCase {

  final PoshRepository poshRepository;
  GetpdfUseCase(this.poshRepository);
  Future<List<PostModel>> execute(bool coneccion) async {
    return await poshRepository.getPdf( coneccion);
  }
}