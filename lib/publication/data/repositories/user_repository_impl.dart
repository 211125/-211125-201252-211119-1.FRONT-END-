import 'package:flutter_application_1/publication/domain/repositories/user_repository.dart';

import '../../domain/entities/post.dart';


import '../datasources/user_data_source.dart';
import '../models/getuser_model.dart';
import '../models/posh_model.dart';

class PoshRepositoryImpl implements PoshRepository {
  final PoshLocalDataSourceImp poshLocalDataSource;

  PoshRepositoryImpl( {required this.poshLocalDataSource,});





  @override
  Future<void> createpublication(createModel user,bool connection) async {
    await poshLocalDataSource.createpublication(user,connection);
  }

  @override
  Future<List<PostModel>> getUsers(bool coneccion) async {
    return await poshLocalDataSource.getUsers( coneccion);

  }
  @override
  Future<List<PostModel>> getVideo(bool coneccion) async {
    return await poshLocalDataSource.getVideo(coneccion);

  } @override
  Future<List<PostModel>> getAudio(bool coneccion) async {
    return await poshLocalDataSource.getAudio(coneccion);

  }

  @override
  Future<List<PostModel>> getGif() async {
    return await poshLocalDataSource.getGif();

  }
  @override
  Future<List<PostModel>> getPdf(bool coneccion) async {
    return await poshLocalDataSource.getPdf(coneccion);

  }
  //  @override
  //   Future<void> createUser(UserModel user) async {
  //     await userLocalDataSource.createUser(user);
  //   }



}
