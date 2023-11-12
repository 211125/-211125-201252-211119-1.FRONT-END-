import 'package:bloc/bloc.dart';

import '../../../domain/usecases/getreaction_usercase.dart';
import 'getReaction_event.dart';
import 'getReaction_state.dart';


class GetReactionBloc extends Bloc<GetReactionEvent, GetReactionState> {
  final GetReactionCountUseCase? getReactionCountUseCase;

  GetReactionBloc({required this.getReactionCountUseCase})
      : super(GetReactionInitial());

  @override
  Stream<GetReactionState> mapEventToState(GetReactionEvent event) async* {
    if (event is FetchReactionCountEvent) {
      yield GetReactionLoading();
      try {
        final count = await getReactionCountUseCase!.execute(event.id);
        yield GetReactionLoaded(count);
      } catch (e) {
        yield GetReactionError('Error al obtener el conteo de reacciones');
      }
    }
  }
}