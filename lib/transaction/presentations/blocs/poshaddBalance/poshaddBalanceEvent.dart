part of 'poshaddBalanceBloc.dart';

@immutable
abstract class addBalanceEvent {}
class AddBalancePressed extends addBalanceEvent {
  final int userId;
  final int balance;



  AddBalancePressed({required this.userId,required this.balance});

}
