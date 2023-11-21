import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/entities/createTransaction.dart';
import '../../domain/entities/getAccount.dart';
import '../../domain/entities/getTransactions.dart';
import '../models/addBalanceModel.dart';
import '../models/createtransaction.dart';



abstract class ReactionLocalDataSource {
  Future<void> updateAddBalance(AddBalanceModel add);
  Future<void> updateReduceBalance(AddBalanceModel add);
  Future<List<getAccount>> getaccount(int id,int userId);
  Future<List<getTransactions>> getAllTransactions(int accountId);
  Future<List<getTransactions>> getTransaction(int id,int accountId);
  Future<void> createTransaction(createtransactionModel transaction);

}

class TransactionLocalDataSourceImp implements ReactionLocalDataSource {
  final String _baseUrl = 'http://192.168.1.73:3000';

  @override
  Future<void> createTransaction(createtransactionModel transaction) async {
    try {
      // Codifica los datos del modelo en formato JSON
      var transactionData = jsonEncode({
        'date': transaction.date,
        'type': transaction.type.toString(), // Asegúrate de convertir el booleano a String si es necesario
        'amount': transaction.amount.toString(),
        'description': transaction.description,
        'categoriId': transaction.categoriId.toString(),
        'accountId': transaction.accountId.toString(),
      });

      // Realiza la llamada HTTP POST con los datos
      await http.post(
        Uri.parse('$_baseUrl/transaction/create'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: transactionData,
      );
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }
  }


  @override
  Future<List<getTransactions>> getAllTransactions(int accountId) {
    // TODO: implement getAllTransactions
    throw UnimplementedError();
  }

  @override
  Future<List<getTransactions>> getTransaction(int id, int accountId) {
    // TODO: implement getTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<getAccount>> getaccount(int id, int userId) {
    // TODO: implement getaccount
    throw UnimplementedError();
  }

  @override
  Future<void> updateAddBalance(AddBalanceModel add) async{
    try {
      await http.put(
        Uri.parse('$_baseUrl/account/balance/add/${add.userId}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, int>{
          'balance': add.balance,
        }),
      );
    } catch (e) {
      print('Error during network updateAddBalance: $e');
      throw Exception('Network updateAddBalance');
    }
  }

  @override
  Future<void> updateReduceBalance(AddBalanceModel add) {
    // TODO: implement updateReduceBalance
    throw UnimplementedError();
  }

}