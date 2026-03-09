import 'package:equatable/equatable.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';

class FavoriteEntity extends Equatable {
  final int id;
  final int favoId;
  final double priceWithDiscount;
  final ProductEntity? product;

  const FavoriteEntity({
    required this.id,
    required this.favoId,
    required this.priceWithDiscount,
    this.product,
  });

  @override
  List<Object?> get props => [id, favoId, product];
}