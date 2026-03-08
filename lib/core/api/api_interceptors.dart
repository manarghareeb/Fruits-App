import 'package:dio/dio.dart';
import 'package:fruits_app/core/api/api_keys.dart';
import 'package:fruits_app/core/services/secure_storage_service.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await SecureStorageService.getToken();

    if (token != null) {
      options.headers[ApiKeys.authorization] = 'Bearer $token';
    }

    options.headers["Content-Type"] = "application/json";
    options.headers["Accept"] = "application/json";

    super.onRequest(options, handler);
  }
}
