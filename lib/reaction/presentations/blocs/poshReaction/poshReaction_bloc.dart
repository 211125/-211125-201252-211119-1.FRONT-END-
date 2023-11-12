import 'package:bloc/bloc.dart';

import '../../../domain/usecases/poshreaction_usercase.dart';
import 'poshReaction_event.dart';
import 'poshReaction_state.dart';


class PoshReactionBloc extends Bloc<PoshReactionEvent, PoshReactionState> {
  final PoshReactionUseCase? poshReactionUseCase;

  PoshReactionBloc({required this.poshReactionUseCase})
      : super(PoshReactionInitial());

  @override
  Stream<PoshReactionState> mapEventToState(PoshReactionEvent event) async* {
    if (event is PostReactionEvent) {
      yield PoshReactionLoading();
      try {
        await poshReactionUseCase?.excute(event.user);
        yield PoshReactionSuccess();
      } catch (e) {
        yield PoshReactionFailure("Network error");
      }
    }
  }
}





