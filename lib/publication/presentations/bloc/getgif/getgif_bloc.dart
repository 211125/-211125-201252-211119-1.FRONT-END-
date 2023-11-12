import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/publication/domain/usecases/getpost_usercase.dart.dart';
import '../../../data/models/getuser_model.dart';
import '../../../domain/usecases/getAudio_usecase.dart';
import '../../../domain/usecases/getVideo_usercase.dart';
import '../../../domain/usecases/getgif_usecase.dart';
import 'getgif_event.dart';
import 'getgif_state.dart';


class GetgifBloc extends Bloc<GetgiftEvent, GetgifState> {
  final GetgitUseCase? getgitUseCase;


  GetgifBloc({required this.getgitUseCase}) : super(GetgifInitialState()) {
      on<GetgiftEvent>((event, emit) async {
        if(event is FetchgifEvent) {
          emit(GetgifLoadingState());
          try {
            emit(GetgifLoadingState());
            List<PostModel> posts = await getgitUseCase!.execute();
            emit(GetgifLoadedState(posts));
          } catch (e) {
            emit(GetgifErrorState(e.toString()));
          }
        }
      });
    }
    }



