

import '../../data/models/addBalanceModel.dart';
import '../../data/models/createtransaction.dart';
import '../../data/models/getBalance.dart';
import '../entities/addBalance.dart';
import '../entities/createTransaction.dart';
import '../entities/getAccount.dart';
import '../entities/getTransactions.dart';

abstract class TransactionRepository{
  Future<void> updateAddBalance(AddBalanceModel add);
  Future<void> updateReduceBalance(AddBalanceModel add);
  Future<void> createTransaction(createtransactionModel transaction);

  Future<List<GetBalanceModel>> getaccount(int id,int userId);
  Future<List<createtransactionModel>> getAllTransactions(int accountId);
  Future<List<getTransactions>> getTransaction(int id,int accountId);

}