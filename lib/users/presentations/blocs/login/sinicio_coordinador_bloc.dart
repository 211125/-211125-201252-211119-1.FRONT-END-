import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/userLogin.dart';
import '../../../domain/usecases/poshlogin_usercase.dart';

part 'inicio_coordinador_event.dart';
part 'inicio_coordinador_state.dart';

class InicioCoordinadorBloc extends Bloc<InicioCoordinadorEvent, InicioCoordinadorState> {
  BuildContext context;
  final LoginUser loginCoordinadorUsecase;

  Future<bool> login(String email, String password) async {
    try {
      emit(InicioCoordinadorLoading());

      Login login = Login(
        email: email,
        password: password,
      );
      await loginCoordinadorUsecase.excute(login);
      return true;
    } catch (e) {
      emit(InicioCoordinadorFailure(e.toString()));
      return false;
    }
  }

  InicioCoordinadorBloc(this.context, this.loginCoordinadorUsecase) : super(InicioCoordinadorInitial()) {
    on<InicioCoordinadorEvent>((event, emit) async {

    });
  }
}
