part of 'sinicio_coordinador_bloc.dart';

@immutable
abstract class InicioCoordinadorState{
  @override
  List<Object?> get props => [];
}

class InicioCoordinadorInitial extends InicioCoordinadorState {}

class InicioCoordinadorLoading extends InicioCoordinadorState {}

class InicioCoordinadorSuccess extends InicioCoordinadorState {}

class InicioCoordinadorFailure extends InicioCoordinadorState {
  final String error;

  InicioCoordinadorFailure(this.error);

  @override
  List<Object?> get props => [error];
}
