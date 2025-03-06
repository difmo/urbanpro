
import 'package:URBANPRO/models/admin/transaction.dart';

class TransactionService {
  Future<List<Transaction>> fetchTransactions() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate API delay
    return [
      Transaction(id: "T1", userName: "Alice", userType: "Student", amount: 100.0, date: "2024-03-10", status: "Completed"),
      Transaction(id: "T2", userName: "Bob", userType: "Student", amount: 75.0, date: "2024-03-09", status: "Pending"),
      Transaction(id: "T3", userName: "Charlie", userType: "Student", amount: 50.0, date: "2024-03-08", status: "Failed"),
      Transaction(id: "T4", userName: "Mr. David", userType: "Teacher", amount: 200.0, date: "2024-03-10", status: "Completed"),
      Transaction(id: "T5", userName: "Ms. Emma", userType: "Teacher", amount: 150.0, date: "2024-03-09", status: "Pending"),
      Transaction(id: "T6", userName: "Mr. Frank", userType: "Teacher", amount: 100.0, date: "2024-03-08", status: "Failed"),
    ];
  }
}
