class createtransaction {
  int ? id;
  final String date;
  final bool type;
  final int amount;
  final String description;
  final int categoriId;
  final int accountId;



  createtransaction({
    this.id,
    required this.date,
    required this.type,
    required this.amount,
    required this.description,
    required this.categoriId,
    required this.accountId
  });

}

