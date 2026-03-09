abstract class AddOrRemoveFavoriteState {}

class AddOrRemoveFavoriteInitial extends AddOrRemoveFavoriteState {}

class AddOrRemoveFavoriteLoading extends AddOrRemoveFavoriteState {}

class AddOrRemoveFavoriteSuccess extends AddOrRemoveFavoriteState {}

class AddOrRemoveFavoriteError extends AddOrRemoveFavoriteState {
  final String message;
  AddOrRemoveFavoriteError(this.message);
}
