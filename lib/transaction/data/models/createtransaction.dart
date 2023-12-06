import '../../domain/entities/createTransaction.dart';

class createtransactionModel extends createtransaction {

  createtransactionModel({
    int? id,
    required String date,
    required bool type,
    required int amount,
    required String description,
    required int categoriId,
    required int accountId
  }) : super(id:id,date:date, type: type, amount: amount,description:description,categoriId:categoriId,accountId:accountId );


  factory createtransactionModel.fromJson(Map<String, dynamic> json) {

    return createtransactionModel(
      id: json['id'] ,
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
      id: post.id,
      date: post.date,
      type: post.type,
      amount: post.amount,
      description: post.description,
       categoriId: post.categoriId,
        accountId: post.categoriId
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
'type': type,
    'amount':amount,
      'description':description,
      'categoriId':categoriId,
      'accountId':accountId
    };
  }

}