import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/publication/domain/usecases/getpost_usercase.dart.dart';

import '../../../data/models/getcomment.dart';
import '../../../domain/usecases/getcomment_usercase.dart';


part 'getcomment_event.dart';
part 'getcomment_state.dart';


class GetcommentBloc extends Bloc<GetcommentEvent, GetcommentState> {
  final GetCommentUseCase? getCommentUseCase;


  GetcommentBloc({required this.getCommentUseCase}) : super(GetcommentInitialState()) {
      on<GetcommentEvent>((event, emit) async {
        if(event is FetchcommentEvent) {
          emit(GetcommentLoadingState());
          try {
//            print(event.coneccion);

            emit(GetcommentLoadingState());
            List<GetCommentModel> posts = await getCommentUseCase!.execute(event.idpublicacion);
            emit(GetcommentLoadedState(posts));
          } catch (e) {
            emit(GetcommentErrorState(e.toString()));
          }
        }
      });
    }
    }



