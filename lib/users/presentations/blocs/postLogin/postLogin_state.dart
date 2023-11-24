part of 'postLogin_bloc.dart';

@immutable
abstract class InicioState{
  @override
  List<Object?> get props => [];
}

class InicioInitial extends InicioState {}

class InicioCoordinadorLoading extends InicioState {}

class InicioCoordinadorSuccess extends InicioState {}

class InicioCoordinadorFailure extends InicioState {
  final String error;

  InicioCoordinadorFailure(this.error);

  @override
  List<Object?> get props => [error];
}

abstract class UserState {
  final int userId;

  UserState(this.userId);
}

class UserInitial extends UserState {
  UserInitial() : super(-1); // -1 indica que no hay usuario
}

class UserLoggedIn extends UserState {
  UserLoggedIn(int userId) : super(userId);
}

