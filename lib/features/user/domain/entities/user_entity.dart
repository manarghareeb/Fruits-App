class UserEntity {
  final bool? status;
  final String? message;
  final int? id;
  final String name;
  final String mobile;
  final String email;
  final String? profilePhotoPath;
  final String? profilePhotoUrl;
  final String token;
  final int? newPassword;

  UserEntity({
    this.status, 
    this.message,
    this.id,
    required this.name,
    required this.mobile,
    required this.email,
    this.profilePhotoPath,
    this.profilePhotoUrl,
    required this.token, 
    this.newPassword, 
  });
}