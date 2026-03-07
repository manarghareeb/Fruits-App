import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class ForgetPasswordUseCase {
  final UserRepository repository;

  ForgetPasswordUseCase({required this.repository});

  Future<Either<Failure, UserEntity>> call({required String phone}) async {
    return await repository.forgetPassword(phone: phone);
  }
}
