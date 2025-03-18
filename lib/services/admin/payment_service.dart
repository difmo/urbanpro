import 'package:URBANPRO/models/admin/coin_transaction.dart';

class PaymentService {
  Future<CoinTransaction> processPayment(double amount, int coins) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate payment delay

    return CoinTransaction(
      id: "TXN${DateTime.now().millisecondsSinceEpoch}",
      amountPaid: amount,
      coinsReceived: coins,
      date: DateTime.now().toString(),
    );
  }
}
