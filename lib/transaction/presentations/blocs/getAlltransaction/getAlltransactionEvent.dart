
part of 'getAlltransactionBloc.dart';

@immutable

abstract class GetallTransactionsEvent extends Equatable {
  const GetallTransactionsEvent();

  @override
  List<Object> get props => [];
}

class FetchGetallTransactionsBloceEvent extends GetallTransactionsEvent {
  final int accountId;


  FetchGetallTransactionsBloceEvent({required this.accountId,});

  @override
  List<Object> get props => [accountId];
}
