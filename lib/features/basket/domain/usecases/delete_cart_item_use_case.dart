import 'package:fruits_app/features/basket/domain/repositories/cart_repository.dart';

class RemoveFromCartUseCase {
  final CartRepository repository;

  RemoveFromCartUseCase({required this.repository});

  Future<void> call(int id) async {
    return await repository.removeFromCart(id);
  }
}