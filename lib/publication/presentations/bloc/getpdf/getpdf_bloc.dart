import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/publication/domain/usecases/getpost_usercase.dart.dart';
import '../../../data/models/getuser_model.dart';
import '../../../domain/usecases/getAudio_usecase.dart';
import '../../../domain/usecases/getPdf_usecase.dart';
import '../../../domain/usecases/getVideo_usercase.dart';
import '../../../domain/usecases/getgif_usecase.dart';
import 'getpdf_event.dart';
import 'getpdf_state.dart';


class GetpdfBloc extends Bloc<GetpdftEvent, GetpdfState> {
  final GetpdfUseCase? getpdfUseCase;


  GetpdfBloc({required this.getpdfUseCase}) : super(GetpdfInitialState()) {
      on<GetpdftEvent>((event, emit) async {
        if(event is FetchpdfEvent) {
          emit(GetpdfLoadingState());
          try {
            emit(GetpdfLoadingState());
            List<PostModel> posts = await getpdfUseCase!.execute();
            emit(GetpdfLoadedState(posts));
          } catch (e) {
            emit(GetpdfErrorState(e.toString()));
          }
        }
      });
    }
    }



