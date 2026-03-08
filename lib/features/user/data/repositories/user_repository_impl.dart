import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/expections.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/user/domain/entities/user_entity.dart';

import '../../domain/repositories/user_repository.dart';
import '../data_sources/user_remote_data_source.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserModel>> login({
    required String phoneEmail,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.login(phoneEmail, password);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.toFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> register({
    required String name,
    required String mobile,
    required String email,
    required String password,
    required String confirmPassword,
    required String oneSignalId,
  }) async {
    try {
      final user = await remoteDataSource.register({
        'name': name,
        'mobile': mobile,
        'email': email,
        'password': password,
        'c_password': confirmPassword,
        'onesignal_id': oneSignalId,
      });
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.toFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> forgetPassword({
    required String phone,
  }) async {
    try {
      final userModel = await remoteDataSource.forgetPassword(phone);
      return Right(userModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateProfile({
    required int userId,
    required String name,
    required String email,
    required String mobile,
    String? address,
    String? imagePath,
  }) async {
    try {
      final userModel = await remoteDataSource.updateProfile(
        userId: userId,
        name: name,
        email: email,
        mobile: mobile,
        address: address,
        imagePath: imagePath,
      );
      return Right(userModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> contactUs({
    required String name,
    required String mobile,
    required String message,
  }) async {
    try {
      final userModel = await remoteDataSource.contactUs(
        name: name,
        mobile: mobile,
        message: message,
      );
      return Right(userModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.errorMessage));
    }
  }
}
