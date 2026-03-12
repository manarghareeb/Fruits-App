import 'package:fruits_app/core/helper/database_helper.dart';
import 'package:fruits_app/features/categories/data/models/product_model.dart';

abstract class CartLocalDataSource {
  Future<void> addProduct(ProductModel product);
  Future<List<ProductModel>> getCartProducts();
  Future<void> deleteProduct(int id);
  Future<void> updateQuantity(int id, int quantity);
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final SqliteService sqliteService;
  CartLocalDataSourceImpl({required this.sqliteService});

  @override
  Future<void> addProduct(ProductModel product) async {
    await sqliteService.insertProduct(product.toJson());
  }

  @override
  Future<List<ProductModel>> getCartProducts() async {
    final data = await sqliteService.getAllCartProducts();
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Future<void> deleteProduct(int id) async {
    await sqliteService.deleteProduct(id);
  }

  @override
  Future<void> updateQuantity(int id, int quantity) async {
    await sqliteService.updateProductQuantity(id, quantity);
  }
}