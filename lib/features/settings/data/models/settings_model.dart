import 'package:fruits_app/features/settings/domain/entities/settings_entity.dart';

class SettingsModel extends SettingsEntity {
  SettingsModel({
    required super.name,
    required super.details,
    required super.image,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      name: json['data']['name_en'] ?? '',
      details: json['data']['details_en'] ?? '',
      image: json['data']['img'] ?? '',
    );
  }
}
