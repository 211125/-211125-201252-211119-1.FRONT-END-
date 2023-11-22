

import '../../data/models/addBalanceModel.dart';
import '../repositories/transaction_repository.dart';

class PoshaddBalanceUseCase {
  final TransactionRepository transactionRepository;

  PoshaddBalanceUseCase(this.transactionRepository);

  Future<void> execute(AddBalanceModel transaction) async {
    try {
      await transactionRepository.updateAddBalance(transaction);
    } catch (e) {
      print('Error al crear el  poshaddBalance: $e');
      throw e;
    }

  }
}
