import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/settings/domain/entities/settings_entity.dart';
import 'package:fruits_app/features/settings/domain/repositories/settings_repository.dart';

class GetConditionsUseCase {
  final SettingsRepository repository;
  GetConditionsUseCase({required this.repository});

  Future<Either<Failure, SettingsEntity>> call() async {
    return await repository.getConditions();
  }
}
