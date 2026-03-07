import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';

import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class LoginUseCase {
  final UserRepository repository;

  LoginUseCase({required this.repository});

  Future<Either<Failure, UserEntity>> call({
    required String phoneEmail,
    required String password,
  }) async {
    return await repository.login(phoneEmail: phoneEmail, password: password);
  }
}
