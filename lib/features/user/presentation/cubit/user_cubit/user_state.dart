import 'package:fruits_app/features/user/domain/entities/user_entity.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserEntity userEntity;

  UserSuccess(this.userEntity);
}

class UserFailure extends UserState {
  final String message;

  UserFailure(this.message);
}
