import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/publication/domain/usecases/getpost_usercase.dart.dart';
import '../../../data/models/getuser_model.dart';
import '../../../domain/usecases/getVideo_usercase.dart';
import 'getvideo_event.dart';
import 'getvideo_state.dart';


class GetvideoBloc extends Bloc<GetvideotEvent, GetvideoState> {
  final GetvideoUseCase? getvideoUseCase;


  GetvideoBloc({required this.getvideoUseCase}) : super(GetvideoInitialState()) {
      on<GetvideotEvent>((event, emit) async {
        if(event is FetchvideoEvent) {
          emit(GetvideoLoadingState());
          try {
            emit(GetvideoLoadingState());
            List<PostModel> posts = await getvideoUseCase!.execute();
            emit(GetvideoLoadedState(posts));
          } catch (e) {
            emit(GetvideoErrorState(e.toString()));
          }
        }
      });
    }
    }
    /* @override
    Stream<GetPostState> mapEventToState(GetPostEvent event) async* {
      if (event is FetchPostEvent) {
      //  yield GetPostLoadingState();
        try {
          final List<PostModel> posts = await getpostUseCase!.execute();

          yield GetPostLoadedState(posts);
        } catch (e) {
          yield GetPostErrorState(e.toString());
        }
      }
    }
  }*/


