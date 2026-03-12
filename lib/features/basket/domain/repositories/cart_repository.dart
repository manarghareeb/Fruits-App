import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';

abstract class CartRepository {
  Future<List<ProductEntity>> getCartItems();
  Future<void> addToCart(ProductEntity product);
  Future<void> removeFromCart(int id);
  Future<void> changeQuantity(int id, int quantity);
}