import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/settings/domain/entities/settings_entity.dart';

abstract class SettingsRepository {
  Future<Either<Failure, SettingsEntity>> getAboutUs();
  Future<Either<Failure, SettingsEntity>> getConditions();
}
