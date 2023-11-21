

import 'package:flutter_application_1/transaction/data/datasources/transaction_data_source.dart';
import 'package:flutter_application_1/transaction/data/repositories/transaction_repository_impl.dart';
import 'package:flutter_application_1/transaction/domain/usecases/createtransaction_usecase.dart';

class TransactioncaseConfig {
 TransactionLocalDataSourceImp? transactionLocalDataSourceImp;
 TransactionRepositoryImpl? transactionRepositoryImpl;
 CreatetransactionUseCase? createtransactionUseCase;
 TransactioncaseConfig() {
   transactionLocalDataSourceImp = TransactionLocalDataSourceImp();
   transactionRepositoryImpl = TransactionRepositoryImpl(transactionLocalDataSource: transactionLocalDataSourceImp!);
   createtransactionUseCase = CreatetransactionUseCase(transactionRepositoryImpl!);
  }
}
