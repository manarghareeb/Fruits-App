import 'package:equatable/equatable.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';

class SubCategoryEntity extends Equatable {
  final int id;
  final String name;
  final String nameEn;
  final String image;
  final List<ProductEntity> products;

  const SubCategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.products, 
    required this.nameEn,
  });

  @override
  List<Object?> get props => [id, name, image, products, nameEn];
}
