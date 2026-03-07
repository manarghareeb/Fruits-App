import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/expections.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/settings/data/data_sources/settings_remote_data_source.dart';
import 'package:fruits_app/features/settings/domain/entities/settings_entity.dart';
import 'package:fruits_app/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource remoteDataSource;

  SettingsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, SettingsEntity>> getAboutUs() async {
    try {
      final remoteData = await remoteDataSource.getAboutUs();
      return Right(remoteData);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, SettingsEntity>> getConditions() async {
    try {
      final remoteData = await remoteDataSource.getConditions();
      return Right(remoteData);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.errorMessage));
    }
  }
}