import '../../data/models/getuser_model.dart';
import '../repositories/user_repository.dart';

class GetgitUseCase {

  final PoshRepository poshRepository;
  GetgitUseCase(this.poshRepository);
  Future<List<PostModel>> execute() async {
    return await poshRepository.getGif();
  }
}