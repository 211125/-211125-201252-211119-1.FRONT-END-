import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/models/post_comment.dart';
import '../../../domain/usecases/poshComment_usercase.dart';


part 'poshcommentEvent.dart';
part 'poshcommentState.dart';

class  poshcommentBloc extends Bloc<commetEvent, commentState> {

    final PoshcommentUseCase? poshcommentUseCase;

    poshcommentBloc({required this.poshcommentUseCase}) : super(commentInitial()) {
    on<commetEvent>((event, emit) async {
      if (event is commentPressed) {
        try {
          emit(commentLoading());
          poshCommentModel transaction = poshCommentModel(
              publicationId: event.id_publicacion,
              userId: event.id_user,
            content: event.content
          );
          await poshcommentUseCase!.excute(transaction);
        } catch (e) {
          emit(commentFailure(e.toString()));
        }
      }
    });
  }
}
