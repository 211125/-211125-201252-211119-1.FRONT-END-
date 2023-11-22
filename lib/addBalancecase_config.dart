

import 'package:flutter_application_1/transaction/data/datasources/transaction_data_source.dart';
import 'package:flutter_application_1/transaction/data/repositories/transaction_repository_impl.dart';
import 'package:flutter_application_1/transaction/domain/usecases/createtransaction_usecase.dart';
import 'package:flutter_application_1/transaction/domain/usecases/getaccount_usercase.dart';
import 'package:flutter_application_1/transaction/domain/usecases/poshaddBalance_usecase.dart';

class TransactioncaseConfig {
 TransactionLocalDataSourceImp? transactionLocalDataSourceImp;
 TransactionRepositoryImpl? transactionRepositoryImpl;
 CreatetransactionUseCase? createtransactionUseCase;
 PoshaddBalanceUseCase? poshaddBalanceUseCase;
 GetaccountUseCase? getaccountUseCase;
 TransactioncaseConfig() {
   transactionLocalDataSourceImp = TransactionLocalDataSourceImp();
   transactionRepositoryImpl = TransactionRepositoryImpl(transactionLocalDataSource: transactionLocalDataSourceImp!);
   createtransactionUseCase = CreatetransactionUseCase(transactionRepositoryImpl!);
   poshaddBalanceUseCase = PoshaddBalanceUseCase(transactionRepositoryImpl!);
   getaccountUseCase = GetaccountUseCase(transactionRepositoryImpl!);
  }
}
