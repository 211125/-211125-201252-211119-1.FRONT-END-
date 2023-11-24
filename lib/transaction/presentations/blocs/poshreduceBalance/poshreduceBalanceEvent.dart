part of 'poshreduceBalanceBloc.dart';

@immutable
abstract class reduceBalanceEvent {}
class reduceBalancePressed extends reduceBalanceEvent {
  final int userId;
  final int balance;



  reduceBalancePressed({required this.userId,required this.balance});

}
