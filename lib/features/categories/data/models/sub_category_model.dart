import 'package:fruits_app/features/categories/data/models/product_model.dart';
import 'package:fruits_app/features/categories/domain/entities/sub_category_entity.dart';

class SubCategoryModel extends SubCategoryEntity {
  const SubCategoryModel({
    required super.id,
    required super.name,
    required super.image,
    required super.products, 
    required super.nameEn,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'],
      name: json['name'] ?? '',
      nameEn: json['name_en'] ?? '',
      image: json['img'] ?? '',
      products: json['products'] != null
          ? List<ProductModel>.from(
              json['products'].map((x) => ProductModel.fromJson(x)),
            )
          : [],
    );
  }
}
