import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await storage.write(key: 'auth_token', value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'auth_token');
  }

  static Future<void> deleteToken() async {
    await storage.delete(key: 'auth_token');
  }
}