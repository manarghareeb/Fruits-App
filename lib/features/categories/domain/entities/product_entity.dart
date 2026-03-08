/*import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final double price;
  final double discount;
  final int quantity;
  final String unit;
  final String details;
  final int isFavorite;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.discount,
    required this.quantity,
    required this.unit,
    required this.details,
    required this.isFavorite,
  });

  double get finalPrice => price - discount;

  @override
  List<Object?> get props => [
    id,
    name,
    image,
    price,
    discount,
    quantity,
    unit,
    details,
    isFavorite,
  ];
}
*/

// features/categories/domain/entities/product_entity.dart

import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String nameEn;
  final String image;
  final double price;
  final double discount;
  final int quantity;
  final String unit;
  final String unitEn;
  final String details;
  final String detailsEn;
  final int vendorId;
  final int categoryId;
  final String nameCategory;
  final String nameCategoryEn;
  final int isFavorite;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.image,
    required this.price,
    required this.discount,
    required this.quantity,
    required this.unit,
    required this.unitEn,
    required this.details,
    required this.detailsEn,
    required this.vendorId,
    required this.categoryId,
    required this.nameCategory,
    required this.nameCategoryEn,
    required this.isFavorite,
  });

  @override
  List<Object?> get props => [id, name, nameEn, image, isFavorite];
}