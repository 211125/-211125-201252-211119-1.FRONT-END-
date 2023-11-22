part of 'getBalanceBloc.dart';

@immutable
abstract class GetBalanceState extends Equatable {
  const GetBalanceState();

  @override
  List<Object> get props => [];
}

class GetBalanceInitialState extends GetBalanceState {}

class GetBalanceLoadingState extends GetBalanceState {}

class GetBalanceLoadedState extends GetBalanceState {
  final List<GetBalanceModel> balances;

  const GetBalanceLoadedState(this.balances);

  @override
  List<Object> get props => [balances];
}

class GetBalanceErrorState extends GetBalanceState {
  final String error;

  const GetBalanceErrorState(this.error);

  @override
  List<Object> get props => [error];
}
