part of 'getAlltransactionBloc.dart';

@immutable
abstract class GetalltransactionState extends Equatable {
  const GetalltransactionState();

  @override
  List<Object> get props => [];
}

class GetalltransactionInitialState extends GetalltransactionState {}

class GetalltransactionLoadingState extends GetalltransactionState {}

class GetalltransactionLoadedState extends GetalltransactionState {
  final List<createtransactionModel> balances;

  const GetalltransactionLoadedState(this.balances);

  @override
  List<Object> get props => [balances];
}

class GetalltransactionErrorState extends GetalltransactionState {
  final String error;

  const GetalltransactionErrorState(this.error);

  @override
  List<Object> get props => [error];
}
