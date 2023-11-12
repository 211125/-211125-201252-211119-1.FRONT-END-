import 'package:bloc/bloc.dart';
import '../../../domain/usecases/poshpost_usercase.dart';
import 'createpost_event.dart';
import 'createpost_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final CreatepostUseCase? createUserUseCase;

  CreatePostBloc({required this.createUserUseCase}) : super(UserInitial());

  @override
  Stream<CreatePostState> mapEventToState(CreatePostEvent event) async* {
    print("Evento recibido: $event");

    if (event is CreateUserEvent) {
      yield UserLoading();
      try {
        print("Antes de llamar a createUserUseCase");
        await createUserUseCase!.execute(event.user);
        print("Después de llamar a createUserUseCase");
        yield UserCreatedSuccessfully();
        print("object");
      } catch (e) {
        print(e);

        yield UserCreationFailure(e.toString());
      }
    }
  }
}
