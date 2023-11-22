import '../../data/models/getBalance.dart';
import '../entities/getAccount.dart';
import '../repositories/transaction_repository.dart';

class GetaccountUseCase {
  final TransactionRepository transactionRepository;

  GetaccountUseCase(this.transactionRepository);

  Future<List<GetBalanceModel>> execute(int id,int userId) async {
    return await transactionRepository.getaccount(id, userId);
  }

}
