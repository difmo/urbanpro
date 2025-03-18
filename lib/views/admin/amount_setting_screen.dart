import 'package:URBANPRO/models/admin/coin_transaction.dart';
import 'package:URBANPRO/services/admin/payment_service.dart';
import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/custom_button.dart';
import 'package:URBANPRO/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AmountSettingScreen extends StatefulWidget {
  @override
  _AmountSettingScreenState createState() => _AmountSettingScreenState();
}

class _AmountSettingScreenState extends State<AmountSettingScreen> {
  final _amountController = TextEditingController();
  final _coinRateController = TextEditingController();
  final _coinsReceivedController = TextEditingController();
  final PaymentService _paymentService = PaymentService();
  CoinTransaction? _transaction;
  bool _isProcessing = false;
  int _coinRate = 5; // Default: 1 coin = $5

  @override
  void initState() {
    super.initState();
    _coinRateController.text = _coinRate.toString();
  }

  void _calculateCoins() {
    if (_amountController.text.isNotEmpty) {
      double amount = double.parse(_amountController.text);
      int calculatedCoins = (amount / _coinRate).toInt();
      _coinsReceivedController.text = calculatedCoins.toString();
    }
  }

  void _handlePayment() async {
    if (_amountController.text.isEmpty ||
        _coinsReceivedController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter amount and coins")),
      );
      return;
    }

    setState(() {
      _isProcessing = true;
    });

    double amount = double.parse(_amountController.text);
    int coins = int.parse(_coinsReceivedController.text);

    try {
      CoinTransaction transaction =
          await _paymentService.processPayment(amount, coins);
      setState(() {
        _transaction = transaction;
        _isProcessing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "Payment Successful! Coins Received: ${transaction.coinsReceived}")),
      );
    } catch (e) {
      setState(() => _isProcessing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment Failed")),
      );
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _coinRateController.dispose();
    _coinsReceivedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.white,
      appBar: AppBar(
          title: Text(
        "Amount & Coin Settings",
        style: AppTextStyle.Text18700,
      )),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Set Coin Rate",
                style: AppTextStyle.Text18700,
              ),
            ),
            SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    inputType: InputType.phone,
                    label: "Enter Coin Rate",
                    hint: "Enter Coin Rate (e.g. 5 = 1 coin per 5)",
                    controller: _coinRateController,
                    onChanged: (value) {
                      setState(() {
                        _coinRate = int.parse(value);
                      });
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            /// **User Payment**
            Container(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Buy Coins",
                style: AppTextStyle.Text18700,
              ),
            ),
            SizedBox(height: 8),

            CommonTextField(
              onChanged: (_) => _calculateCoins(),
              inputType: InputType.phone,
              label: "Enter Amount",
              hint: "Enter Amount",
              controller: _amountController,
            ),

            SizedBox(height: 12),

            CommonTextField(
              onChanged: (_) => _calculateCoins(),
              inputType: InputType.phone,
              label: "Coins Received (Editable)",
              hint: "Enter Coins Received (Editable)",
              controller: _coinsReceivedController,
            ),

            SizedBox(height: 20),

            /// **Proceed to Payment**
            _isProcessing
                ? Center(child: CircularProgressIndicator())
                : SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      width: 70,
                      baseTextColor: ThemeConstants.whiteColor,
                      text: 'Update Setting',
                      onPressed: _handlePayment,
                    ),
                  ),

            if (_transaction != null) ...[
              SizedBox(height: 24),
              Divider(),
              Text(
                "Transaction Details",
                style: AppTextStyle.Text18700,
              ),
              Text(
                "Amount Paid: ₹${_transaction!.amountPaid}",
                style: AppTextStyle.Text12300,
              ),
              Text(
                "Coins Received: ${_transaction!.coinsReceived}",
                style: AppTextStyle.Text12300,
              ),
              Text(
                "Date: ${_transaction!.date}",
                style: AppTextStyle.Text12300,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
