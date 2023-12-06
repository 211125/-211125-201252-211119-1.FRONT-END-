
import '../../data/models/getuser_model.dart';
import '../../data/models/posh_model.dart';

abstract class PoshRepository {
  Future<List<PostModel>> getUsers(bool coneccion);

  Future<void> createpublication(createModel user,bool connection);
  Future<List<PostModel>> getVideo(bool coneccion);
  Future<List<PostModel>> getAudio(bool coneccion);
  Future<List<PostModel>> getPdf(bool coneccion);

  Future<List<PostModel>> getGif();

}