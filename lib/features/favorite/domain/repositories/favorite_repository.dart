import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/favorite/domain/entities/favorite_entity.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<FavoriteEntity>>> fetchFavorites();
  Future<Either<Failure, void>> addFavorite({required String favoId});
}