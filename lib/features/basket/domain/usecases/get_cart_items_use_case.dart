import 'package:fruits_app/features/basket/domain/repositories/cart_repository.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';

class GetCartItemsUseCase {
  final CartRepository repository;
  GetCartItemsUseCase({required this.repository});
  Future<List<ProductEntity>> call() async {
    return await repository.getCartItems();
  }
}