part of 'getcomment_bloc.dart';

@immutable
abstract class GetcommentEvent extends Equatable {
  const GetcommentEvent();

  @override
  List<Object> get props => [];
}

class FetchcommentEvent extends GetcommentEvent {
  final int idpublicacion;
  FetchcommentEvent({required this.idpublicacion});
}
