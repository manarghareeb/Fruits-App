import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/favorite/domain/entities/favorite_entity.dart';
import 'package:fruits_app/features/favorite/domain/repositories/favorite_repository.dart';

class GetFavoritesUseCase {
  final FavoritesRepository repository;

  GetFavoritesUseCase({required this.repository});

  Future<Either<Failure, List<FavoriteEntity>>> call() async {
    return await repository.fetchFavorites();
  }
}