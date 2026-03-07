import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/user/domain/entities/user_entity.dart';
import 'package:fruits_app/features/user/domain/repositories/user_repository.dart';

class UpdateProfileUseCase {
  final UserRepository repository;
  UpdateProfileUseCase({required this.repository});

  Future<Either<Failure, UserEntity>> call({
    required int userId,
    required String name,
    required String email,
    required String mobile,
    String? address,
    String? imagePath,
  }) async {
    return await repository.updateProfile(
      userId: userId,
      name: name,
      email: email,
      mobile: mobile,
      address: address,
      imagePath: imagePath,
    );
  }
}
