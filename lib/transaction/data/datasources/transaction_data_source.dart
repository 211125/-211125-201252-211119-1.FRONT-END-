import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/createTransaction.dart';
import '../../domain/entities/getAccount.dart';
import '../../domain/entities/getTransactions.dart';
import '../models/addBalanceModel.dart';
import '../models/createtransaction.dart';
import '../models/getBalance.dart';



abstract class ReactionLocalDataSource {
  Future<void> updateAddBalance(AddBalanceModel add);
  Future<void> updateReduceBalance(AddBalanceModel add);
  Future<List<getAccount>> getaccount(int id,int userId);
  Future<List<createtransactionModel>> getAllTransactions(int accountId, bool conexion);
  Future<List<getTransactions>> getTransaction(int id,int accountId);
  Future<void> createTransaction(createtransactionModel transaction);

}

class TransactionLocalDataSourceImp implements ReactionLocalDataSource {
  final String _baseUrl = 'https://plv3w7fl-3000.usw3.devtunnels.ms';

  @override
  Future<void> createTransaction(createtransactionModel transaction) async {
    try {
      // Codifica los datos del modelo en formato JSON
      var transactionData = jsonEncode({
        'date': transaction.date,
        'type': transaction.type.toString(),
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
  Future<List<createtransactionModel>> getAllTransactions(int accountId, bool conexion) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      var response;
      var jsonResponse;
      bool success = false;

      if (conexion) {
        response = await http.get(Uri.parse('$_baseUrl/transaction/list/all/$accountId'));
        if (response.statusCode == 200) {
          jsonResponse = jsonDecode(response.body);

          if (jsonResponse['status'] == 'success' && jsonResponse.containsKey('data')) {
            List<createtransactionModel> transactions = (jsonResponse['data'] as List)
                .map((item) => createtransactionModel.fromJson(item as Map<String, dynamic>))
                .toList();

            // Almacenar las transacciones en SharedPreferences
            sharedPreferences.setString('transactions', jsonEncode(transactions.map((t) => t.toJson()).toList()));
            return transactions; // Devolver la lista de transacciones
          } else {
            throw Exception('Failed to load transactions');
          }
        } else {
          throw Exception('Failed to load transactions');
        }
      } else {
        String transactionsString = sharedPreferences.getString('transactions') ?? "[]";
        jsonResponse = jsonDecode(transactionsString);
        success = true;
      }

      if (success) {
        List<createtransactionModel> transactions = jsonResponse.map<createtransactionModel>(
                (transaction) => createtransactionModel.fromJson(transaction)
        ).toList();

        return transactions;
      } else {
        throw Exception('Failed to load transactions');
      }
    } catch (e) {
      print('Error al obtener las transacciones: $e');
      throw e;
    }
  }



  @override
  Future<List<getTransactions>> getTransaction(int id, int accountId) {
    // TODO: implement getTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<GetBalanceModel>> getaccount(int id, int userId) async {
    try {
      var response = await http.get(Uri.parse('$_baseUrl/account/get/balance/${id}/${userId}'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        // Verificar si la respuesta es exitosa y contiene la clave 'data'
        if (jsonResponse['status'] == 'success' && jsonResponse.containsKey('data')) {
          // Crear un GetBalanceModel a partir del objeto 'data'
          GetBalanceModel balance = GetBalanceModel.fromJson(jsonResponse['data']);
          return [balance]; // Devolver como una lista
        } else {
          throw Exception('Failed to load balance');
        }
      } else {
        throw Exception('Failed to load balance');
      }
    } catch (e) {
      print('Error al obtener el balance: $e');
      throw e;
    }
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
  Future<void> updateReduceBalance(AddBalanceModel add)async {
    try {
      await http.put(
        Uri.parse('$_baseUrl/account/balance/reduce/${add.userId}'),
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

}