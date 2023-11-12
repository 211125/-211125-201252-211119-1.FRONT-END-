
import '../../data/models/getuser_model.dart';
import '../../data/models/posh_model.dart';

abstract class PoshRepository {
  Future<List<PostModel>> getUsers();

  Future<void> createpublication(createModel user);
  Future<List<PostModel>> getVideo();
  Future<List<PostModel>> getAudio();

  Future<List<PostModel>> getGif();

}