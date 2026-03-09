import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/favorite/domain/repositories/favorite_repository.dart';

class AddFavoriteUseCase {
  final FavoritesRepository repository;

  AddFavoriteUseCase({required this.repository});

  Future<Either<Failure, void>> call(String favoId) async {
    return await repository.addFavorite(favoId: favoId);
  }
}