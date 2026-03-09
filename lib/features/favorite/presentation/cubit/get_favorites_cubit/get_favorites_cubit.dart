import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/favorite/domain/usecases/get_favorite_usecase.dart';
import 'package:fruits_app/features/favorite/presentation/cubit/get_favorites_cubit/get_favorites_state.dart';

class GetFavoritesCubit extends Cubit<GetFavoritesState> {
  final GetFavoritesUseCase getFavoritesUseCase;

  GetFavoritesCubit({required this.getFavoritesUseCase}) : super(GetFavoritesInitial());

  Future<void> getFavorites() async {
    emit(GetFavoritesLoading());
    final result = await getFavoritesUseCase();
    result.fold(
      (failure) => emit(GetFavoritesError(failure.message)),
      (favorites) => emit(GetFavoritesSuccess(favorites)),
    );
  }
}