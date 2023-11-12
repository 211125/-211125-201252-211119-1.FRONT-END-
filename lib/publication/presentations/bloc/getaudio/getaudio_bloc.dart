import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/publication/domain/usecases/getpost_usercase.dart.dart';
import '../../../data/models/getuser_model.dart';
import '../../../domain/usecases/getAudio_usecase.dart';
import '../../../domain/usecases/getVideo_usercase.dart';
import 'getaudio_event.dart';
import 'getaudio_state.dart';


class GetaudioBloc extends Bloc<GetaudiotEvent, GetaudioState> {
  final GetaudioUseCase? getaudioUseCase;


  GetaudioBloc({required this.getaudioUseCase}) : super(GetaudioInitialState()) {
      on<GetaudiotEvent>((event, emit) async {
        if(event is FetchaudioEvent) {
          emit(GetaudioLoadingState());
          try {
            emit(GetaudioLoadingState());
            List<PostModel> posts = await getaudioUseCase!.execute();
            emit(GetaudioLoadedState(posts));
          } catch (e) {
            emit(GetaudioErrorState(e.toString()));
          }
        }
      });
    }
    }



