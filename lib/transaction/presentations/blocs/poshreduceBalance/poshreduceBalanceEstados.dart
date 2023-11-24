part of 'poshreduceBalanceBloc.dart';

@immutable
abstract class createreduceBalanceState {}

class createreduceBalanceInitial extends createreduceBalanceState {}

class createreduceBalanceLoading extends createreduceBalanceState {}

class createreduceBalanceSuccess extends createreduceBalanceState {}

class createreduceBalanceFailure extends createreduceBalanceState {
  final String error;

  createreduceBalanceFailure(this.error);

  @override
  List<Object?> get props => [error];
}
