

import '../../data/models/addBalanceModel.dart';
import '../repositories/transaction_repository.dart';

class PoshreduceBalanceUseCase {
  final TransactionRepository transactionRepository;

  PoshreduceBalanceUseCase(this.transactionRepository);

  Future<void> execute(AddBalanceModel transaction) async {
    try {
      await transactionRepository.updateReduceBalance(transaction);
    } catch (e) {
      print('Error al crear el  poshaddBalance: $e');
      throw e;
    }

  }
}
