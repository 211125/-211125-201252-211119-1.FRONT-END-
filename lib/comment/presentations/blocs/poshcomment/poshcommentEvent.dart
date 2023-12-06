part of 'poshcommentBloc.dart';

@immutable
abstract class commetEvent {}
class commentPressed extends commetEvent {
  final int id_user;
  final int id_publicacion;
  final String content;



  commentPressed({required this.id_user,required this.id_publicacion,required this.content});

}
