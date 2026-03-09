import 'package:fruits_app/core/api/api_consumer.dart';
import 'package:fruits_app/core/api/end_ponits.dart';
import 'package:fruits_app/features/favorite/data/models/favorite_model.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<FavoriteModel>> getFavorites();
  Future<void> addFavorites({required String favoId});
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final ApiConsumer apiConsumer;

  FavoritesRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<FavoriteModel>> getFavorites() async {
    final response = await apiConsumer.get('${EndPoint.favorite}/t/ar');
    final List data = response['data'];
    return data.map((json) => FavoriteModel.fromJson(json)).toList();
  }

  @override
  Future<void> addFavorites({required String favoId}) async {
    final response = await apiConsumer.post(
      EndPoint.favorite,
      data: {'favo_id': favoId},
    );
    if (response['result'] != true) {
      throw Exception(response['error_mesage_en'] ?? 'Failed to add');
    }
  }
}
