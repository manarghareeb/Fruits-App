import 'package:fruits_app/core/api/api_consumer.dart';
import 'package:fruits_app/core/api/end_ponits.dart';
import 'package:fruits_app/features/categories/data/models/category_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getCategoriesWithSub();
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final ApiConsumer apiConsumer;

  CategoriesRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<CategoryModel>> getCategoriesWithSub() async {
    final response = await apiConsumer.get(
      "${EndPoint.categoriesGetWithSub}/ar/0/0",
    );
    return (response['data'] as List)
        .map((category) => CategoryModel.fromJson(category))
        .toList();
  }
}
