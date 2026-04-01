import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fruits_app/core/api/api_consumer.dart';
import 'package:fruits_app/core/api/api_keys.dart';
import 'package:fruits_app/core/api/end_ponits.dart';
import 'package:fruits_app/core/services/secure_storage_service.dart';

import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> login(String phoneEmail, String password);
  Future<UserModel> register(Map<String, dynamic> userData);
  Future<UserModel> forgetPassword(String phone);
  Future<UserModel> updateProfile({
    required int userId,
    required String name,
    required String email,
    required String mobile,
    String? address,
    String? imagePath,
  });
  Future<UserModel> contactUs({
    required String name,
    required String mobile,
    required String message,
  });
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiConsumer apiConsumer;
  UserRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<UserModel> login(String phoneEmail, String password) async {
    final response = await apiConsumer.post(
      EndPoint.login,
      data: {ApiKeys.phoneEmail: phoneEmail, ApiKeys.password: password},
    );
    if (response['status'] == true && response['data'] != null) {
      final token = response['data']['token'];
      if (token != null) {
        await SecureStorageService.saveToken(token);
      }
    }
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> register(Map<String, dynamic> userData) async {
    final formData = FormData.fromMap(userData);
    final response = await apiConsumer.post(EndPoint.register, data: formData);
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> forgetPassword(String phone) async {
    final response = await apiConsumer.post(
      EndPoint.fotgetPassword,
      data: {'email': phone},
    );
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> updateProfile({
    required int userId,
    required String name,
    required String email,
    required String mobile,
    String? address,
    String? imagePath,
  }) async {
    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'mobile': mobile,
      'address': address ?? "",
    };
    if (imagePath != null && imagePath.isNotEmpty) {
      data['profile_photo_path'] = await MultipartFile.fromFile(imagePath);
    }
    log('$userId');
    final response = await apiConsumer.post(
      "${EndPoint.updateProfile}/$userId",
      data: FormData.fromMap(data),
    );
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> contactUs({
    required String name,
    required String mobile,
    required String message,
  }) async {
    final response = await apiConsumer.post(
      EndPoint.contactUs,
      data: {'name': name, 'message': message, 'mobile': mobile},
    );
    return UserModel.fromJson(response);
  }
}
