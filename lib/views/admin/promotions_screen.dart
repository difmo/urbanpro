import 'package:URBANPRO/models/admin/promotion_model.dart';
import 'package:URBANPRO/services/admin/promotion_service.dart';
import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/admin/promotion_card.dart';
import 'package:URBANPRO/views/widgets/custom_button.dart';
import 'package:URBANPRO/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PromotionsScreen extends StatefulWidget {
  @override
  _PromotionsScreenState createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  final PromotionService _promotionService = PromotionService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  DateTime? _expiryDate;

  List<Promotion> _promotions = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchPromotions();
  }

  Future<void> _fetchPromotions() async {
    setState(() => _isLoading = true);
    List<Promotion> promotions = await _promotionService.fetchPromotions();
    setState(() {
      _promotions = promotions;
      _isLoading = false;
    });
  }

  void _addPromotion() {
    if (_titleController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _discountController.text.isEmpty ||
        _expiryDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    Promotion newPromotion = Promotion(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text,
      description: _descriptionController.text,
      discount: double.parse(_discountController.text),
      expiryDate: _expiryDate!,
    );

    _promotionService.addPromotion(newPromotion);
    _fetchPromotions();

    _titleController.clear();
    _descriptionController.clear();
    _discountController.clear();
    setState(() => _expiryDate = null);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Promotion Added!")),
    );
  }

  void _deletePromotion(String id) {
    _promotionService.deletePromotion(id);
    _fetchPromotions();
  }

  Future<void> _pickExpiryDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() => _expiryDate = pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.white,
      appBar: AppBar(
          backgroundColor: ThemeConstants.white,
          title: Text(
            "Promotions & Offers",
            style: AppTextStyle.Text18700,
          )),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CommonTextField(
              controller: _titleController,
              label: "Promotion Title",
              inputType: InputType.address,
              onChanged: (value) {},
              hint: '',
            ),
            SizedBox(height: 8),
            CommonTextField(
              controller: _descriptionController,
              label: "Description",
              maxLines: 3,
              inputType: InputType.address,
              onChanged: (value) {},
              hint: '',
            ),
            SizedBox(height: 8),
            CommonTextField(
              controller: _discountController,
              label: "Discount %",
              inputType: InputType.phone,
              onChanged: (value) {},
              hint: '',
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(_expiryDate == null
                    ? "Select Expiry Date"
                    : "Expiry Date: ${_expiryDate!.toLocal().toString().split(' ')[0]}"),
                Spacer(),
                IconButton(
                    onPressed: _pickExpiryDate,
                    icon: Icon(Icons.calendar_today)),
              ],
            ),
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                width: 70,
                baseTextColor: ThemeConstants.whiteColor,
                text: 'Add Promotion',
                onPressed: _addPromotion,
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: _promotions.length,
                      itemBuilder: (context, index) {
                        return PromotionCard(
                          promotion: _promotions[index],
                          onEdit: () {},
                          onDelete: () =>
                              _deletePromotion(_promotions[index].id),
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
