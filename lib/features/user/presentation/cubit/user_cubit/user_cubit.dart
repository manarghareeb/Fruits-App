import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/user/domain/usecases/contact_us_usecase.dart';
import 'package:fruits_app/features/user/domain/usecases/forget_password_usecase.dart';
import 'package:fruits_app/features/user/domain/usecases/update_profile_usecase.dart';

import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/register_usecase.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final ContactUsUsecase contactUsUsecase;

  UserCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.forgetPasswordUseCase,
    required this.updateProfileUseCase,
    required this.contactUsUsecase,
  }) : super(UserInitial());

  Future<void> login({required String email, required String password}) async {
    emit(UserLoading());
    final result = await loginUseCase.call(
      phoneEmail: email,
      password: password,
    );

    result.fold((failure) => emit(UserFailure(failure.message)), (user) {
      if (user.status == false) {
        emit(UserFailure(user.message ?? "Login credentials are incorrect"));
      } else {
        emit(UserSuccess(user));
      }
    });
  }

  Future<void> register({
    required String name,
    required String email,
    required String mobile,
    required String password,
    required String confirmPassword,
  }) async {
    emit(UserLoading());

    final params = RegisterParams(
      name: name,
      mobile: mobile,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      oneSignalId: "lkfjfkj0450jflfjotij5iufdiueiu433i4ujkdnfd",
    );

    final result = await registerUseCase.call(params);

    result.fold((failure) => emit(UserFailure(failure.message)), (user) {
      if (user.status == false) {
        emit(UserFailure(user.message ?? "Failed to create account"));
      } else {
        emit(UserSuccess(user));
      }
    });
  }

  Future<void> forgetPassword({required String phone}) async {
    emit(UserLoading());

    final result = await forgetPasswordUseCase.call(phone: phone);

    result.fold((failure) => emit(UserFailure(failure.message)), (user) {
      if (user.status == false) {
        emit(UserFailure(user.message ?? "This number does not exist with us"));
      } else {
        emit(UserSuccess(user));
      }
    });
  }

  Future<void> updateProfile({
    required int userId,
    required String name,
    required String email,
    required String mobile,
    String? address,
    String? imagePath,
  }) async {
    emit(UserLoading());

    final result = await updateProfileUseCase.call(
      userId: userId,
      name: name,
      email: email,
      mobile: mobile,
      address: address,
      imagePath: imagePath,
    );

    result.fold(
      (failure) {
        log('Error ${failure.message}');
        emit(UserFailure(failure.message));
      },
      (user) {
        if (user.status == false) {
          emit(UserFailure(user.message ?? "Failed to update profile"));
        } else {
          emit(UserSuccess(user));
        }
      },
    );
  }

  Future<void> contactUs({
    required String name,
    required String mobile,
    required String message,
  }) async {
    emit(UserLoading());
    final result = await contactUsUsecase.call(
      name: name,
      mobile: mobile,
      message: message,
    );
    result.fold((failure) => emit(UserFailure(failure.message)), (user) {
      if (user.status == true) {
        emit(UserSuccess(user));
      } else {
        emit(UserFailure(user.message ?? 'Failed to send message'));
      }
    });
  }
}
