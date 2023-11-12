import '../../data/models/posh_model.dart';
import '../repositories/user_repository.dart';

class CreatepostUseCase {
  final PoshRepository poshRepository;
  CreatepostUseCase(this.poshRepository);
  Future<void> execute(createModel user) async {
    try {
      await poshRepository.createpublication(user);
    } catch (e, stackTrace) {
      print('Error al crear el usuario: $e');
      print('StackTrace: $stackTrace');
      throw e;
    }

  }
}