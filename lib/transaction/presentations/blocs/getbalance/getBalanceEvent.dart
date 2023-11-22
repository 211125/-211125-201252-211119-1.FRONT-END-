
part of 'getBalanceBloc.dart';

@immutable

abstract class GetBalanceEvent extends Equatable {
  const GetBalanceEvent();

  @override
  List<Object> get props => [];
}

class FetchBalanceEvent extends GetBalanceEvent {
  final int id;
  final int userId;

  FetchBalanceEvent({required this.id, required this.userId});

  @override
  List<Object> get props => [id, userId];
}
