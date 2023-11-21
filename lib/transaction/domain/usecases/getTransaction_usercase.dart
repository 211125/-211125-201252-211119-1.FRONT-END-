


import '../entities/getTransactions.dart';
import '../repositories/transaction_repository.dart';

class GetTransactionUseCase {
  final TransactionRepository transactionRepository;

  GetTransactionUseCase(this.transactionRepository);

  Future<List<getTransactions>> execute(int accountId) async {
    return await transactionRepository.getAllTransactions(accountId);
  }

}
