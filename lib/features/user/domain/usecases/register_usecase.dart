import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';

import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class RegisterUseCase {
  final UserRepository repository;

  RegisterUseCase({required this.repository});

  Future<Either<Failure, UserEntity>> call(RegisterParams params) async {
    return await repository.register(
      name: params.name,
      mobile: params.mobile,
      email: params.email,
      password: params.password,
      confirmPassword: params.confirmPassword,
      oneSignalId: params.oneSignalId,
    );
  }
}

class RegisterParams {
  final String name;
  final String mobile;
  final String email;
  final String password;
  final String confirmPassword;
  final String oneSignalId;

  RegisterParams({
    required this.name,
    required this.mobile,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.oneSignalId,
  });
}
