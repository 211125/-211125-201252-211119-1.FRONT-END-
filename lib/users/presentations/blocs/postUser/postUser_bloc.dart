import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/users/presentations/blocs/postUser/postUser_event.dart';
import 'package:flutter_application_1/users/presentations/blocs/postUser/postUser_state.dart';
import '../../../domain/usecases/poshcreate_usercase.dart';

class CreateUserBloc extends Bloc<PoshUserEvent,PostUserState> {
  final PoshCreateUsersUseCase? poshCreateUsersUseCase;

  CreateUserBloc({required this.poshCreateUsersUseCase}) : super(PostUserInitial());

  @override
  Stream<PostUserState> mapEventToState(PoshUserEvent event) async* {
    if (event is CreateUserEvent) {
      yield PostUserLoading();
      try {
        await poshCreateUsersUseCase!.excute(event.user);
        yield PostUserSuccess();
      } catch (_) {
        print("errr xd");
        yield PostUserFailure();
      }
    }
  }
}

