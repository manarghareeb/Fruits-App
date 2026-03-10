import 'package:dio/dio.dart';
import 'package:fruits_app/core/api/api_consumer.dart';
import 'package:fruits_app/core/api/dio_consumer.dart';
import 'package:fruits_app/features/categories/data/data_sources/categories_remote_data_source.dart';
import 'package:fruits_app/features/categories/data/repositories/categories_repository_impl.dart';
import 'package:fruits_app/features/categories/domain/repositories/categories_repository.dart';
import 'package:fruits_app/features/categories/domain/usecases/get_categories_usecase.dart';
import 'package:fruits_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:fruits_app/features/favorite/data/data_sources/favorites_remote_data_source.dart';
import 'package:fruits_app/features/favorite/data/repositories/favorites_repository_impl.dart';
import 'package:fruits_app/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:fruits_app/features/favorite/domain/usecases/add_favorite_usecase.dart';
import 'package:fruits_app/features/favorite/domain/usecases/get_favorite_usecase.dart';
import 'package:fruits_app/features/favorite/presentation/cubit/add_or_remove_favorite_cubit/add_or_remove_favorite_cubit.dart';
import 'package:fruits_app/features/favorite/presentation/cubit/get_favorites_cubit/get_favorites_cubit.dart';
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
import 'package:fruits_app/features/vendors/data/data_sources/vendors_remote_data_source.dart';
import 'package:fruits_app/features/vendors/data/repositories/vendor_repository_impl.dart';
import 'package:fruits_app/features/vendors/domain/repositories/vendor_repository.dart';
import 'package:fruits_app/features/vendors/domain/usecases/get_vendor_products_usecase.dart';
import 'package:fruits_app/features/vendors/domain/usecases/get_vendors_usecase.dart';
import 'package:fruits_app/features/vendors/presentation/vendor_products_cubit/vendor_products_cubit.dart';
import 'package:fruits_app/features/vendors/presentation/vendors_cubit/vendor_cubit.dart';
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
  sl.registerLazySingleton<CategoriesRemoteDataSource>(
    () => CategoriesRemoteDataSourceImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton<FavoritesRemoteDataSource>(
    () => FavoritesRemoteDataSourceImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton<VendorsRemoteDataSource>(
    () => VendorsRemoteDataSourceImpl(apiConsumer: sl()),
  );

  /// Repositories
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(favoritesRemoteDataSource: sl()),
  );
  sl.registerLazySingleton<VendorRepository>(
    () => VendorRepositoryImpl(remoteDataSource: sl()),
  );

  /// UseCases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(repository: sl()));
  sl.registerLazySingleton(() => ForgetPasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(repository: sl()));
  sl.registerLazySingleton(() => ContactUsUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetAboutUsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetConditionsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCategoriesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetFavoritesUseCase(repository: sl()));
  sl.registerLazySingleton(() => AddFavoriteUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetVendorProductsUsecase(vendorRepository: sl()));
  sl.registerLazySingleton(() => GetVendorsUsecase(vendorRepository: sl()));

  /// Cubits
  sl.registerFactory(
    () => UserCubit(
      loginUseCase: sl(),
      registerUseCase: sl(),
      forgetPasswordUseCase: sl(),
      updateProfileUseCase: sl(),
      contactUsUsecase: sl(),
    ),
  );
  sl.registerFactory(
    () => SettingsCubit(getAboutUsUseCase: sl(), getConditionsUseCase: sl()),
  );
  sl.registerFactory(() => CategoriesCubit(getCategoriesUseCase: sl()));
  sl.registerFactory(() => AddOrRemoveFavoriteCubit(addFavoriteUseCase: sl()));
  sl.registerFactory(() => GetFavoritesCubit(getFavoritesUseCase: sl()));
  sl.registerFactory(() => VendorCubit(getVendorsUseCase: sl()));
  sl.registerFactory(() => VendorProductsCubit(getVendorProductsUsecase: sl()));
}
