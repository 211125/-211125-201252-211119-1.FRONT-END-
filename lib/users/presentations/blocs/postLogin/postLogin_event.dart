part of 'postLogin_bloc.dart';

@immutable
abstract class InicioEvent {
  @override
  List<Object?> get props => [];
}

class IniciarSesionPressed extends InicioEvent {
  final String email;
  final String password;

  IniciarSesionPressed( {required this.email, required this.password});


  @override
  List<Object?> get props => [email, password];
}
