import 'package:fruits_app/core/api/api_consumer.dart';
import 'package:fruits_app/core/api/end_ponits.dart';
import 'package:fruits_app/features/settings/data/models/settings_model.dart';

abstract class SettingsRemoteDataSource {
  Future<SettingsModel> getAboutUs();
  Future<SettingsModel> getConditions();
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final ApiConsumer apiConsumer;
  SettingsRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<SettingsModel> getAboutUs() async {
    final response = await apiConsumer.get(EndPoint.aboutUs);
    return SettingsModel.fromJson(response);
  }

  @override
  Future<SettingsModel> getConditions() async {
    final response = await apiConsumer.get(EndPoint.conditions);
    return SettingsModel.fromJson(response);
  }
}
