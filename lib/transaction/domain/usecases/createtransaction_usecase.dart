
import '../../data/models/createtransaction.dart';
import '../entities/createTransaction.dart';
import '../repositories/transaction_repository.dart';

class CreatetransactionUseCase {
  final TransactionRepository transactionRepository;
  CreatetransactionUseCase(this.transactionRepository);
  Future<void> execute(createtransactionModel transaction) async {
    try {
      await transactionRepository.createTransaction(transaction);
    } catch (e, stackTrace) {
      print('Error al crear la transaction: $e');
      print('StackTrace: $stackTrace');
      throw e;
    }

  }
}