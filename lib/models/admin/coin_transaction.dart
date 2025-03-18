class CoinTransaction {
  final String id;
  final double amountPaid;
  final int coinsReceived;
  final String date;

  CoinTransaction({
    required this.id,
    required this.amountPaid,
    required this.coinsReceived,
    required this.date,
  });

  factory CoinTransaction.fromJson(Map<String, dynamic> json) {
    return CoinTransaction(
      id: json['id'],
      amountPaid: json['amountPaid'],
      coinsReceived: json['coinsReceived'],
      date: json['date'],
    );
  }
}
