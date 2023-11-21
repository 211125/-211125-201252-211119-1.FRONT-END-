part of 'poshTransactionBloc.dart';

@immutable
abstract class createTransactionState {}

class createTransactionInitial extends createTransactionState {}

class createTransactionLoading extends createTransactionState {}

class createTransactionSuccess extends createTransactionState {}

class createTransactionFailure extends createTransactionState {
  final String error;

  createTransactionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
