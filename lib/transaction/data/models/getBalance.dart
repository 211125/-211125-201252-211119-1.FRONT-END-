

import '../../domain/entities/addBalance.dart';
import '../../domain/entities/getAccount.dart';

class GetBalanceModel extends getAccount {

  GetBalanceModel({
    required int id,
    required int userId,
    required int balance,
  }) : super(id:id,userId:userId,balance: balance);


  factory GetBalanceModel.fromJson(Map<String, dynamic> json) {
    return GetBalanceModel(
      id : json['id'] ,
      userId : json['userId'] ,
      balance: json['balance'] ?? 0,

    );
  }

  factory GetBalanceModel.fromEntity(getAccount getAccounts) {
    return GetBalanceModel(
      id: getAccounts.id,
      userId: getAccounts.userId,
      balance: getAccounts.balance,
    );
  }
}
