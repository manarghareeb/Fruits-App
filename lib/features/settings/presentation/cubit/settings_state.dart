import 'package:fruits_app/features/settings/domain/entities/settings_entity.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsSuccess extends SettingsState {
  final SettingsEntity settingsEntity;
  SettingsSuccess({required this.settingsEntity});
}

class SettingsFailure extends SettingsState {
  final String message;
  SettingsFailure({required this.message});
}