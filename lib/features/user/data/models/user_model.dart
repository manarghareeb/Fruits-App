import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.status,
    super.message,
    super.id,
    required super.name,
    required super.mobile,
    required super.email,
    super.profilePhotoPath,
    super.profilePhotoUrl,
    required super.token,
    super.newPassword
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final Map<String, dynamic> userData = data ?? json['user'] ?? json;
    final String userToken = userData['token'] ?? json['token'] ?? "";

    return UserModel(
      //status: json['status'],
      status: json['result'] ?? json['status'] ?? false,
      //message: json['message'],
      message: json['error_message_en'] ?? json['message'] ?? json['error_message'] ?? "",
      //id: userData['id'],
      id: userData['id'] != null ? int.parse(userData['id'].toString()) : null,
      name: userData['name'] ?? "",
      mobile: userData['mobile'] ?? "",
      email: userData['email'] ?? "",
      profilePhotoPath: userData['profile_photo_path'],
      profilePhotoUrl: userData['profile_photo_url'],
      token: userToken,
      newPassword: data != null ? data['new_password'] : null,
    );
  }
}