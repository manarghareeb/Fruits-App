import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/settings/domain/usecases/get_about_us_usecase.dart';
import 'package:fruits_app/features/settings/domain/usecases/get_conditions_usecase.dart';
import 'package:fruits_app/features/settings/presentation/cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetAboutUsUseCase getAboutUsUseCase;
  final GetConditionsUseCase getConditionsUseCase;

  SettingsCubit({
    required this.getAboutUsUseCase,
    required this.getConditionsUseCase,
  }) : super(SettingsInitial());

  Future<void> getAboutUs() async {
    emit(SettingsLoading());
    final result = await getAboutUsUseCase();
    result.fold(
      (failure) => emit(SettingsFailure(message: failure.message)),
      (settings) => emit(SettingsSuccess(settingsEntity: settings)),
    );
  }

  Future<void> getConditions() async {
    emit(SettingsLoading());
    final result = await getConditionsUseCase();
    result.fold(
      (failure) => emit(SettingsFailure(message: failure.message)),
      (settings) => emit(SettingsSuccess(settingsEntity: settings)),
    );
  }
}
