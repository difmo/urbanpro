import 'package:URBANPRO/models/admin/promotion_model.dart';

class PromotionService {
  List<Promotion> _promotions = [
    Promotion(
      id: "1",
      title: "New Year Offer",
      description: "Get 20% off on subscriptions!",
      discount: 20,
      expiryDate: DateTime(2024, 12, 31),
    ),
    Promotion(
      id: "2",
      title: "Student Discount",
      description: "Students get 15% discount!",
      discount: 15,
      expiryDate: DateTime(2024, 10, 15),
    ),
  ];

  Future<List<Promotion>> fetchPromotions() async {
    await Future.delayed(Duration(seconds: 1)); // Simulating network delay
    return _promotions;
  }

  Future<void> addPromotion(Promotion promotion) async {
    _promotions.add(promotion);
  }

  Future<void> deletePromotion(String id) async {
    _promotions.removeWhere((promotion) => promotion.id == id);
  }
}
