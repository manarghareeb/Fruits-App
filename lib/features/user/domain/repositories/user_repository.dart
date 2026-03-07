import 'package:dartz/dartz.dart';
import 'package:fruits_app/features/user/domain/entities/user_entity.dart';

import '../../../../core/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> login({
    required String phoneEmail,
    required String password,
  });

  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String mobile,
    required String email,
    required String password,
    required String confirmPassword,
    required String oneSignalId,
  });

  Future<Either<Failure, UserEntity>> forgetPassword({required String phone});

  Future<Either<Failure, UserEntity>> updateProfile({
    required int userId,
    required String name,
    required String email,
    required String mobile,
    String? address,
    String? imagePath,
  });

  Future<Either<Failure, UserEntity>> contactUs({
    required String name,
    required String mobile,
    required String message
  });
}
