import 'package:URBANPRO/models/admin/transaction.dart';
import 'package:URBANPRO/services/admin/transaction_service.dart';
import 'package:URBANPRO/views/widgets/admin/transaction_card.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatefulWidget {
  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  late TransactionService _transactionService;
  List<Transaction> _transactions = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _transactionService = TransactionService();
    _fetchTransactions();
  }

  Future<void> _fetchTransactions() async {
    setState(() => _isLoading = true);

    try {
      List<Transaction> transactions = await _transactionService.fetchTransactions();
      setState(() {
        _transactions = transactions;
        _isLoading = false;
      });
    } catch (error) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transactions')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _transactions.isEmpty
              ? Center(child: Text("No transactions found"))
              : ListView.builder(
                  itemCount: _transactions.length,
                  itemBuilder: (context, index) {
                    Transaction transaction = _transactions[index];
                    return TransactionCard(
                      userName: transaction.userName,
                      userType: transaction.userType,
                      amount: transaction.amount,
                      date: transaction.date,
                      status: transaction.status,
                    );
                  },
                ),
    );
  }
}
