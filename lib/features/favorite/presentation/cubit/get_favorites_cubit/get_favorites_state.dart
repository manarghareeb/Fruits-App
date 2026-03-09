import 'package:fruits_app/features/favorite/domain/entities/favorite_entity.dart';

abstract class GetFavoritesState {}

class GetFavoritesInitial extends GetFavoritesState {}

class GetFavoritesLoading extends GetFavoritesState {}

class GetFavoritesSuccess extends GetFavoritesState {
  final List<FavoriteEntity> favorites;
  GetFavoritesSuccess(this.favorites);
}

class GetFavoritesError extends GetFavoritesState {
  final String message;
  GetFavoritesError(this.message);
}
