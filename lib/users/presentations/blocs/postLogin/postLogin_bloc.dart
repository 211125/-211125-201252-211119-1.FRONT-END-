import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/users/presentations/blocs/postLogin/postLogin_event.dart';
import 'package:flutter_application_1/users/presentations/blocs/postLogin/postLogin_state.dart';
import '../../../domain/entities/userLogin.dart';
import '../../../domain/usecases/poshlogin_usercase.dart';
class PostLoginBloc extends Bloc<PostLoginEvent, PostLoginState> {
  final LoginUser? loginUser;
  int? userId; // Variable para almacenar el userId

  PostLoginBloc({required this.loginUser}) : super(PostLoginInitial());

  @override
  Stream<PostLoginState> mapEventToState(PostLoginEvent event) async* {
    if (event is PostLoginStarted) {
      yield PostLoginLoading();
      try {
        final UserLogin? user = await loginUser!.excute(event.email, event.password);
        print(user);

          yield PostLoginSuccess(user);
        //yield PostLoginSuccess(user);

      } catch (e) {
        yield PostLoginFailure(message: e.toString());
      }
    }
  }
}
