class Transaction {
  final String id;
  final String userName;
  final String userType; // "Student" or "Teacher"
  final double amount;
  final String date;
  final String status;

  Transaction({
    required this.id,
    required this.userName,
    required this.userType,
    required this.amount,
    required this.date,
    required this.status,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      userName: json['userName'],
      userType: json['userType'], // Identify Student or Teacher
      amount: json['amount'].toDouble(),
      date: json['date'],
      status: json['status'],
    );
  }
}
