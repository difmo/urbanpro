import 'package:URBANPRO/models/admin/promotion_model.dart';
import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PromotionCard extends StatelessWidget {
  final Promotion promotion;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PromotionCard({super.key, 
    required this.promotion,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(promotion.title, style: AppTextStyle.Text18700),
            SizedBox(height: 4),
            Text(promotion.description, style: AppTextStyle.Text14300),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discount: ${promotion.discount}%",
                  style: AppTextStyle.Text14300,
                ),
                Text(
                  "Expiry: ${promotion.expiryDate.toLocal().toString().split(' ')[0]}",
                  style: AppTextStyle.Text14300,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: "Edit Offer",
                  onPressed: onEdit,
                  backgroundColor: ThemeConstants.secondaryColor,
                  textColor: ThemeConstants.black,
                ),
                CustomButton(
                  text: "Delete",
                  onPressed: onDelete,
                  textColor: ThemeConstants.white,
                  backgroundColor: ThemeConstants.red,
                  icon: Icon(
                    Icons.delete,
                    size: 18,
                    color: ThemeConstants.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
