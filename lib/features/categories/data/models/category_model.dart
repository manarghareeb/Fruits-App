import 'package:fruits_app/features/categories/data/models/sub_category_model.dart';
import 'package:fruits_app/features/categories/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.image,
    required super.subCategories,
    required super.nameEn,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'] ?? '',
      nameEn: json['name_en'] ?? '',
      image: json['img'] ?? '',
      subCategories:
          (json['sub_cat'] as List?)
              ?.map((e) => SubCategoryModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
