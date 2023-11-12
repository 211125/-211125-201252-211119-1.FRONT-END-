import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/publication/domain/usecases/getpost_usercase.dart.dart';
import '../../../data/models/getuser_model.dart';
import 'getpost_event.dart';
import 'getpost_state.dart';


class GetPostBloc extends Bloc<GetPostEvent, GetPostState> {
  final GetpostUseCase? getpostUseCase;


    GetPostBloc({required this.getpostUseCase}) : super(GetPostInitialState()) {
      on<GetPostEvent>((event, emit) async {
        if(event is FetchPostEvent) {
          emit(GetPostLoadingState());
          try {
            emit(GetPostLoadingState());
            List<PostModel> posts = await getpostUseCase!.execute();
            emit(GetPostLoadedState(posts));
          } catch (e) {
            emit(GetPostErrorState(e.toString()));
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


