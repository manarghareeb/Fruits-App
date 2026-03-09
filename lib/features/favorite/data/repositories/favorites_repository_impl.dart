import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/favorite/data/data_sources/favorites_remote_data_source.dart';
import 'package:fruits_app/features/favorite/domain/entities/favorite_entity.dart';
import 'package:fruits_app/features/favorite/domain/repositories/favorite_repository.dart';
import '../../../../core/error/expections.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource favoritesRemoteDataSource;

  FavoritesRepositoryImpl({required this.favoritesRemoteDataSource});

  @override
  Future<Either<Failure, List<FavoriteEntity>>> fetchFavorites() async {
    try {
      final favorites = await favoritesRemoteDataSource.getFavorites();
      return Right(favorites);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.errorMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addFavorite({required String favoId}) async {
    try {
      await favoritesRemoteDataSource.addFavorites(favoId: favoId);
      return Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.errorMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}