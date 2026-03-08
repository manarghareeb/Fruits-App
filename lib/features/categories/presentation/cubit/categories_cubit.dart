import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/categories/domain/usecases/get_categories_usecase.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoriesCubit({required this.getCategoriesUseCase})
    : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(CategoriesLoading());

    final result = await getCategoriesUseCase();

    result.fold(
      (failure) => emit(CategoriesError(failure.message)),
      (categories) => emit(CategoriesSuccess(categories)),
    );
  }
}
