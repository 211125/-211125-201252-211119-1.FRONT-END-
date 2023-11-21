

import '../../domain/entities/addBalance.dart';

class AddBalanceModel extends addBalance {

  AddBalanceModel({
    required int userId,

    required int balance,
  }) : super(userId:userId,balance: balance);


  factory AddBalanceModel.fromJson(Map<String, dynamic> json) {
    return AddBalanceModel(
      userId : json['userId'] ?? 0,
      balance: json['balance'] ?? 0,

    );
  }

  factory AddBalanceModel.fromEntity(addBalance addBalances) {
    return AddBalanceModel(
      userId: addBalances.userId,
      balance: addBalances.balance,
    );
  }
}
