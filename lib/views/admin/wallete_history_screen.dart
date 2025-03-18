import 'package:URBANPRO/models/admin/WalletTransaction.dart';
import 'package:URBANPRO/services/admin/WalletService.dart';
import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';

class WalletHistoryScreen extends StatefulWidget {
  const WalletHistoryScreen({Key? key}) : super(key: key);

  @override
  State<WalletHistoryScreen> createState() => _WalletHistoryScreenState();
}

class _WalletHistoryScreenState extends State<WalletHistoryScreen> {
  late Future<List<WalletTransaction>> _transactionsFuture;
  final WalletService _walletService = WalletService();
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  void _loadTransactions() {
    setState(() {
      _transactionsFuture = _walletService.fetchTransactions();
    });
  }

  // Build Transaction Card
  Widget _buildTransactionItem(WalletTransaction transaction) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          transaction.status == "Credit"
              ? Icons.arrow_downward
              : Icons.arrow_upward,
          color: transaction.status == "Credit" ? Colors.green : Colors.red,
        ),
        title: Text(
          "₹${transaction.amount.toStringAsFixed(2)}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Date: ${transaction.date}"),
            Text("Contact: ${transaction.contactNumber}"),
          ],
        ),
        trailing: Text(
          transaction.status,
          style: TextStyle(
              color: transaction.status == "Credit" ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.white,
      appBar: AppBar(
        title: Text(
          'Wallet History',
          style: AppTextStyle.Text20600,
        ),
        backgroundColor: ThemeConstants.white,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search by Date, Amount, or Contact",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
            const SizedBox(height: 16),

            // Transaction List with FutureBuilder
            Expanded(
              child: FutureBuilder<List<WalletTransaction>>(
                future: _transactionsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Failed to load data"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No transactions found"));
                  }

                  final filteredTransactions = snapshot.data!.where((tx) =>
                      tx.date.contains(_searchQuery) ||
                      tx.amount.toString().contains(_searchQuery) ||
                      tx.contactNumber.contains(_searchQuery));

                  return ListView.builder(
                    itemCount: filteredTransactions.length,
                    itemBuilder: (context, index) => _buildTransactionItem(
                        filteredTransactions.elementAt(index)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
