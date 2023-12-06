import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/publication/domain/usecases/getpost_usercase.dart.dart';
import '../../../data/models/getuser_model.dart';
import '../../../domain/usecases/getVideo_usercase.dart';
import '../connectivity_service.dart';
import 'getvideo_event.dart';
import 'getvideo_state.dart';


class GetvideoBloc extends Bloc<GetvideotEvent, GetvideoState> {
  final GetvideoUseCase? getvideoUseCase;
  final ConnectivityService connectivityService;


  GetvideoBloc({required this.getvideoUseCase,required this.connectivityService}) : super(GetvideoInitialState()) {
      on<GetvideotEvent>((event, emit) async {
        if(event is FetchvideoEvent) {
          emit(GetvideoLoadingState());
          try {
            bool isConnected = connectivityService.isConnected;

            List<PostModel> posts = await getvideoUseCase!.execute(isConnected);
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


