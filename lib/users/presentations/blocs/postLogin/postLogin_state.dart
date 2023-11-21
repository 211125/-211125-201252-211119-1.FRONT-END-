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
