import 'package:fruits_app/features/categories/data/models/product_model.dart';
import 'package:fruits_app/features/favorite/domain/entities/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  const FavoriteModel({
    required super.id,
    required super.favoId,
    required super.priceWithDiscount,
    super.product,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'] ?? 0,
      favoId: json['favo_id'] ?? 0,
      priceWithDiscount: (json['price_with_discount'] as num? ?? 0).toDouble(),
      product: json['product'] != null 
          ? ProductModel.fromJson(json['product']) 
          : null,
    );
  }
}