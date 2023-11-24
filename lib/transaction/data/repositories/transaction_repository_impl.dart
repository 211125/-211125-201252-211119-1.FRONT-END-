

import 'package:flutter_application_1/transaction/data/models/addBalanceModel.dart';

import 'package:flutter_application_1/transaction/domain/entities/createTransaction.dart';

import 'package:flutter_application_1/transaction/domain/entities/getAccount.dart';

import 'package:flutter_application_1/transaction/domain/entities/getTransactions.dart';

import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_data_source.dart';
import '../models/createtransaction.dart';
import '../models/getBalance.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionLocalDataSourceImp transactionLocalDataSource;

  TransactionRepositoryImpl( {required this.transactionLocalDataSource});

  @override
  Future<void> createTransaction(createtransactionModel transaction) async {
    await transactionLocalDataSource.createTransaction(transaction);
  }

  @override
  Future<List<createtransactionModel>> getAllTransactions(int accountId) async {
    return await transactionLocalDataSource.getAllTransactions(accountId);

  }

  @override
  Future<List<getTransactions>> getTransaction(int id, int accountId) async {
    return await transactionLocalDataSource.getTransaction(id, accountId);
  }

  @override
  Future<List<GetBalanceModel>> getaccount(int id, int userId) async {
    return await transactionLocalDataSource.getaccount(id, userId);
  }

  @override
  Future<void> updateAddBalance(AddBalanceModel add) async {
    await transactionLocalDataSource.updateAddBalance(add);
  }

  @override
  Future<void> updateReduceBalance(AddBalanceModel add) async {
    await transactionLocalDataSource.updateReduceBalance(add);
  }


}
