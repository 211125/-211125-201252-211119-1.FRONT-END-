import '../../data/models/createtransaction.dart';
import '../entities/getAccount.dart';
import '../entities/getTransactions.dart';
import '../repositories/transaction_repository.dart';

class GetAllTransactionsUseCase {
  final TransactionRepository transactionRepository;

  GetAllTransactionsUseCase(this.transactionRepository);

  Future<List<createtransactionModel>> execute(int accountId) async {
    return await transactionRepository.getAllTransactions(accountId);
  }

}
