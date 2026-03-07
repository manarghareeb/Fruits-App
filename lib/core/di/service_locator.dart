import 'package:dio/dio.dart';
import 'package:fruits_app/core/api/api_consumer.dart';
import 'package:fruits_app/core/api/dio_consumer.dart';
import 'package:fruits_app/features/settings/data/data_sources/settings_remote_data_source.dart';
import 'package:fruits_app/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:fruits_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:fruits_app/features/settings/domain/usecases/get_about_us_usecase.dart';
import 'package:fruits_app/features/settings/domain/usecases/get_conditions_usecase.dart';
import 'package:fruits_app/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:fruits_app/features/user/data/data_sources/user_remote_data_source.dart';
import 'package:fruits_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:fruits_app/features/user/domain/repositories/user_repository.dart';
import 'package:fruits_app/features/user/domain/usecases/contact_us_usecase.dart';
import 'package:fruits_app/features/user/domain/usecases/forget_password_usecase.dart';
import 'package:fruits_app/features/user/domain/usecases/login_usecase.dart';
import 'package:fruits_app/features/user/domain/usecases/register_usecase.dart';
import 'package:fruits_app/features/user/domain/usecases/update_profile_usecase.dart';
import 'package:fruits_app/features/user/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  /// External
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  /// DataSources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton<SettingsRemoteDataSource>(
    () => SettingsRemoteDataSourceImpl(apiConsumer: sl()),
  );

  /// Repositories
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(remoteDataSource: sl()),
  );

  /// UseCases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(repository: sl()));
  sl.registerLazySingleton(() => ForgetPasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(repository: sl()));
  sl.registerLazySingleton(() => ContactUsUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetAboutUsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetConditionsUseCase(repository: sl()));

  /// Cubits
  sl.registerFactory(
    () => UserCubit(
      loginUseCase: sl(),
      registerUseCase: sl(),
      forgetPasswordUseCase: sl(),
      updateProfileUseCase: sl(),
      contactUsUsecase: sl()
    ),
  );
  sl.registerFactory(
    () => SettingsCubit(
      getAboutUsUseCase: sl(),
      getConditionsUseCase: sl(),
    ),
  );
}
