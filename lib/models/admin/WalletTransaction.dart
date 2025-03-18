// WalletTransaction Model with contact number
class WalletTransaction {
  final String id;
  final String userId;
  final String userType; // "Student" or "Teacher"
  final String date;
  final double amount;
  final String status; // "Credit" or "Debit"
  final String contactNumber; // New field

  WalletTransaction({
    required this.id,
    required this.userId,
    required this.userType,
    required this.date,
    required this.amount,
    required this.status,
    required this.contactNumber, // Required
  });

  // Factory to create from JSON
  factory WalletTransaction.fromJson(Map<String, dynamic> json) {
    return WalletTransaction(
      id: json['id'],
      userId: json['userId'],
      userType: json['userType'],
      date: json['date'],
      amount: json['amount'].toDouble(),
      status: json['status'],
      contactNumber: json['contactNumber'],
    );
  }
}
