import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/publication/domain/usecases/getpost_usercase.dart.dart';
import '../../../data/models/getuser_model.dart';
import '../../../domain/usecases/getAudio_usecase.dart';
import '../../../domain/usecases/getVideo_usercase.dart';
import '../connectivity_service.dart';
import 'getaudio_event.dart';
import 'getaudio_state.dart';


class GetaudioBloc extends Bloc<GetaudiotEvent, GetaudioState> {
  final GetaudioUseCase? getaudioUseCase;
  final ConnectivityService connectivityService;


  GetaudioBloc({required this.getaudioUseCase, required this.connectivityService}) : super(GetaudioInitialState()) {
      on<GetaudiotEvent>((event, emit) async {
        if(event is FetchaudioEvent) {
          emit(GetaudioLoadingState());
          try {
            bool isConnected = connectivityService.isConnected;

            emit(GetaudioLoadingState());
            List<PostModel> posts = await getaudioUseCase!.execute(isConnected);
            emit(GetaudioLoadedState(posts));
          } catch (e) {
            emit(GetaudioErrorState(e.toString()));
          }
        }
      });
    }
    }



