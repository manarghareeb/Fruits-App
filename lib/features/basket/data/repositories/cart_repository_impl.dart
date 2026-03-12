import 'package:fruits_app/features/basket/data/data_sources/cart_local_data_source.dart';
import 'package:fruits_app/features/basket/domain/repositories/cart_repository.dart';
import 'package:fruits_app/features/categories/data/models/product_model.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;
  CartRepositoryImpl({required this.localDataSource});

  @override
  Future<List<ProductEntity>> getCartItems() async {
    return await localDataSource.getCartProducts();
  }

  @override
  Future<void> addToCart(ProductEntity product) async {
    await localDataSource.addProduct(ProductModel.fromEntity(product));
  }

  @override
  Future<void> removeFromCart(int id) async {
    await localDataSource.deleteProduct(id);
  }

  @override
  Future<void> changeQuantity(int id, int quantity) async {
    await localDataSource.updateQuantity(id, quantity);
  }
}