
import 'package:flutter_application_1/publication/data/datasources/user_data_source.dart';
import 'package:flutter_application_1/publication/data/repositories/user_repository_impl.dart';
import 'package:flutter_application_1/publication/domain/usecases/getAudio_usecase.dart';
import 'package:flutter_application_1/publication/domain/usecases/getPdf_usecase.dart';
import 'package:flutter_application_1/publication/domain/usecases/getVideo_usercase.dart';
import 'package:flutter_application_1/publication/domain/usecases/getgif_usecase.dart';

import 'package:flutter_application_1/publication/domain/usecases/getpost_usercase.dart.dart';
import 'package:flutter_application_1/publication/domain/usecases/poshpost_usercase.dart';

class PostcaseConfig {
  PoshLocalDataSourceImp? poshLocalDataSourceImp;
  PoshRepositoryImpl? poshRepositoryImpl;
  GetpostUseCase? getpostUseCase;
  CreatepostUseCase? createpostUseCase;
  GetvideoUseCase? getvideoUseCase;
  GetaudioUseCase? getaudioUseCase;
  GetgitUseCase? getgitUseCase;
  GetpdfUseCase? getpdfUseCase;

  PostcaseConfig() {
    poshLocalDataSourceImp = PoshLocalDataSourceImp();
    poshRepositoryImpl = PoshRepositoryImpl(poshLocalDataSource: poshLocalDataSourceImp!);
    getpostUseCase = GetpostUseCase(poshRepositoryImpl!);
    createpostUseCase = CreatepostUseCase(poshRepositoryImpl!);
    getvideoUseCase = GetvideoUseCase(poshRepositoryImpl!);
    getaudioUseCase= GetaudioUseCase(poshRepositoryImpl!);
    getgitUseCase = GetgitUseCase(poshRepositoryImpl!);
    getpdfUseCase = GetpdfUseCase(poshRepositoryImpl!);


  }
}
