part of 'sinicio_coordinador_bloc.dart';

@immutable
abstract class InicioCoordinadorEvent {
  @override
  List<Object?> get props => [];
}

class IniciarSesionPressed extends InicioCoordinadorEvent {
  final String numCoordi;
  final String contrasena;

  IniciarSesionPressed( {required this.numCoordi, required this.contrasena});


  @override
  List<Object?> get props => [numCoordi, contrasena];
}
