import '../../domain/entities/createTransaction.dart';

class createtransactionModel extends createtransaction {

  createtransactionModel({
    required String date,
    required bool type,
    required int amount,
    required String description,
    required int categoriId,
    required int accountId
  }) : super(date:date, type: type, amount: amount,description:description,categoriId:categoriId,accountId:accountId );


  factory createtransactionModel.fromJson(Map<String, dynamic> json) {

    return createtransactionModel(
      date: json['date'] ?? '',
      type: json['type'] ?? '',
      amount: json['amount'] ?? 0,
      description: json['description'] ?? '',
      categoriId: json['categoriId'] ?? 0,
      accountId: json['accountId'] ?? 0,
    );
  }

  factory createtransactionModel.fromEntity(createtransaction post) {
    return createtransactionModel(
      date: post.date,
      type: post.type,
      amount: post.amount,
      description: post.description,
       categoriId: post.categoriId,
        accountId: post.categoriId
    );
  }
}