import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/publication/domain/usecases/getpost_usercase.dart.dart';
import '../../../data/models/getuser_model.dart';
import '../../../domain/usecases/getAudio_usecase.dart';
import '../../../domain/usecases/getPdf_usecase.dart';
import '../../../domain/usecases/getVideo_usercase.dart';
import '../../../domain/usecases/getgif_usecase.dart';
import '../connectivity_service.dart';
import 'getpdf_event.dart';
import 'getpdf_state.dart';


import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/publication/domain/usecases/getpost_usercase.dart.dart';
import '../../../data/models/getuser_model.dart';
import 'getpdf_event.dart';
import 'getpdf_state.dart';

class GetpdfBloc extends Bloc<GetpdftEvent, GetpdfState> {
  final GetpdfUseCase? getpdfUseCase;
  final ConnectivityService connectivityService;

  GetpdfBloc({required this.getpdfUseCase, required this.connectivityService})
      : super(GetpdfInitialState()) {
    on<GetpdftEvent>((event, emit) async {
      if (event is FetchpdfEvent) {
        emit(GetpdfLoadingState());
        try {
          // Usa el servicio de conectividad para obtener el estado actual
          bool isConnected = connectivityService.isConnected;
          List<PostModel> posts = await getpdfUseCase!.execute(isConnected);
          emit(GetpdfLoadedState(posts));
        } catch (e) {
          emit(GetpdfErrorState(e.toString()));
        }
      }
    });
  }
}



