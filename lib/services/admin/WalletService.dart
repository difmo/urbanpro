import 'package:URBANPRO/models/admin/WalletTransaction.dart';

// WalletService Mock Data with contact numbers
class WalletService {
  // Updated Mock Data
  final List<WalletTransaction> _mockTransactions = [
    WalletTransaction(
        id: "1",
        userId: "stu001",
        userType: "Student",
        date: "18 Mar 2025",
        amount: 200,
        status: "Credit",
        contactNumber: "+91 9876543210"),
    WalletTransaction(
        id: "2",
        userId: "stu002",
        userType: "Student",
        date: "17 Mar 2025",
        amount: 150,
        status: "Debit",
        contactNumber: "+91 9876543220"),
    WalletTransaction(
        id: "3",
        userId: "tea001",
        userType: "Teacher",
        date: "18 Mar 2025",
        amount: 500,
        status: "Credit",
        contactNumber: "+91 9876543230"),
    WalletTransaction(
        id: "4",
        userId: "tea002",
        userType: "Teacher",
        date: "16 Mar 2025",
        amount: 100,
        status: "Debit",
        contactNumber: "+91 9876543240"),
  ];

  Future<List<WalletTransaction>> fetchTransactions() async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    return _mockTransactions;
  }
}
