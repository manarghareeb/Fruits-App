import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.nameEn,
    required super.image,
    required super.price,
    required super.discount,
    required super.quantity,
    required super.unit,
    required super.unitEn,
    required super.details,
    required super.detailsEn,
    required super.vendorId,
    required super.categoryId,
    required super.nameCategory,
    required super.nameCategoryEn,
    required super.isFavorite,
    super.cartQuantity
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      nameEn: json['name_en'] ?? '',
      image: json['img'] ?? '',
      price: (json['price'] as num? ?? 0).toDouble(),
      discount: (json['discount'] as num? ?? 0).toDouble(),
      quantity: json['quantity'] ?? 0,
      unit: json['unit'] ?? '',
      unitEn: json['unit_en'] ?? '',
      details: json['details'] ?? '',
      detailsEn: json['details_en'] ?? '',
      vendorId: json['vendor_id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      nameCategory: json['name_category'] ?? '',
      nameCategoryEn: json['name_category_en'] ?? '',
      isFavorite: json['is_favorite'] ?? 0,
      cartQuantity: json['cart_quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_en': nameEn,
      'img': image,
      'price': price,
      'discount': discount,
      'quantity': quantity,
      'unit': unit,
      'unit_en': unitEn,
      'details': details,
      'details_en': detailsEn,
      'vendor_id': vendorId,
      'category_id': categoryId,
      'name_category': nameCategory,
      'name_category_en': nameCategoryEn,
      'is_favorite': isFavorite,
      'cart_quantity': cartQuantity,
    };
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
  return ProductModel(
    id: entity.id,
    name: entity.name,
    nameEn: entity.nameEn,
    image: entity.image,
    price: entity.price,
    discount: entity.discount,
    quantity: entity.quantity,
    unit: entity.unit,
    unitEn: entity.unitEn,
    details: entity.details,
    detailsEn: entity.detailsEn,
    vendorId: entity.vendorId,
    categoryId: entity.categoryId,
    nameCategory: entity.nameCategory,
    nameCategoryEn: entity.nameCategoryEn,
    isFavorite: entity.isFavorite,
    cartQuantity: entity.cartQuantity,
  );
}
}
