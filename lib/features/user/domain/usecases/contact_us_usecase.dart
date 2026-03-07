import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/user/domain/entities/user_entity.dart';
import 'package:fruits_app/features/user/domain/repositories/user_repository.dart';

class ContactUsUsecase {
  final UserRepository repository;

  ContactUsUsecase({required this.repository});

  Future<Either<Failure, UserEntity>> call({
    required String name, 
    required String mobile,
    required String message
  }) async {
    return await repository.contactUs(name: name, mobile: mobile, message: message);
  }
}
