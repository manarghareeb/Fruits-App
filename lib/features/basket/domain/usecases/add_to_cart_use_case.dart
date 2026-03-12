import 'package:fruits_app/features/basket/domain/repositories/cart_repository.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';

class AddToCartUseCase {
  final CartRepository repository;
  AddToCartUseCase({required this.repository});
  Future<void> call(ProductEntity product) async {
    return await repository.addToCart(product);
  }
}