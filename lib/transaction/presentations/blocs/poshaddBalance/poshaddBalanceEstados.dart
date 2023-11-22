part of 'poshaddBalanceBloc.dart';

@immutable
abstract class createaddBalanceState {}

class createaddBalanceInitial extends createaddBalanceState {}

class createaddBalanceLoading extends createaddBalanceState {}

class createaddBalanceSuccess extends createaddBalanceState {}

class createaddBalanceFailure extends createaddBalanceState {
  final String error;

  createaddBalanceFailure(this.error);

  @override
  List<Object?> get props => [error];
}
