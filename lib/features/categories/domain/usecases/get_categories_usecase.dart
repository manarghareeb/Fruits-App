import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/categories/domain/entities/category_entity.dart';
import 'package:fruits_app/features/categories/domain/repositories/categories_repository.dart';

class GetCategoriesUseCase {
  final CategoriesRepository repository;

  GetCategoriesUseCase({required this.repository});

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await repository.getCategories();
  }
}
