import 'package:fruits_app/features/basket/domain/repositories/cart_repository.dart';

class UpdateCartItemUseCase {
  final CartRepository repository;

  UpdateCartItemUseCase({required this.repository});
  Future<void> call(int id, int quantity) async {
    return await repository.changeQuantity(id, quantity);
  }
}
