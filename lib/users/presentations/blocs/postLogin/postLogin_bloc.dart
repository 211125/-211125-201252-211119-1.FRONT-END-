import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/userLogin.dart';
import '../../../domain/usecases/poshlogin_usercase.dart';

part 'postLogin_state.dart';
part 'postLogin_event.dart';

class PostLoginBloc extends Bloc<InicioEvent, InicioState> {
  final LoginUser? loginUser;

  Future<bool> login(String email, String password) async {
    try {
      Login login = Login(
        email: email,
        password: password,
      );
      await loginUser!.excute(login);
      emit(InicioCoordinadorLoading());
      return true;
    } catch (e) {
      emit(InicioCoordinadorFailure(e.toString()));
      return false;
    }
  }


  PostLoginBloc({required this.loginUser}) : super(InicioInitial()) {
    on<InicioEvent>((event, emit) async {

    });
  }
}
