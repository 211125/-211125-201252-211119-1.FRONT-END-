part of 'poshTransactionBloc.dart';

@immutable
abstract class RegisterCoordinatorEvent {}
class CreatetransactionPressed extends RegisterCoordinatorEvent {
  final String date;
  final bool type;
  final int amount;
  final String description;
  final int categoriId;
  final int accountId;

  CreatetransactionPressed({required this.date, required this.type, required this.amount,
    required this.description, required this.categoriId, required this.accountId,});

}
