import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/categories/data/data_sources/categories_remote_data_source.dart';
import 'package:fruits_app/features/categories/domain/entities/category_entity.dart';
import 'package:fruits_app/features/categories/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDataSource remoteDataSource;

  CategoriesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final remoteCategories = await remoteDataSource.getCategoriesWithSub();
      return Right(remoteCategories);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
