import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/favorite/domain/usecases/add_favorite_usecase.dart';
import 'package:fruits_app/features/favorite/presentation/cubit/add_or_remove_favorite_cubit/add_or_remove_favorite_state.dart';

class AddOrRemoveFavoriteCubit extends Cubit<AddOrRemoveFavoriteState> {
  final AddFavoriteUseCase addFavoriteUseCase;

  AddOrRemoveFavoriteCubit({required this.addFavoriteUseCase}) : super(AddOrRemoveFavoriteInitial());

  Future<void> toggleFavorite(String favoId) async {
    emit(AddOrRemoveFavoriteLoading());
    final result = await addFavoriteUseCase(favoId);
    
    result.fold(
      (failure) => emit(AddOrRemoveFavoriteError(failure.message)),
      (_) => emit(AddOrRemoveFavoriteSuccess()),
    );
  }
}