import 'package:equatable/equatable.dart';
import 'package:fruits_app/features/categories/domain/entities/sub_category_entity.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final String nameEn;
  final String image;
  final List<SubCategoryEntity> subCategories;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.subCategories, 
    required this.nameEn,
  });

  @override
  List<Object?> get props => [id, name, image, subCategories, nameEn];
}
