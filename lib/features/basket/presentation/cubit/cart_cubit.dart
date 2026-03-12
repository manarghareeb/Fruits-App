import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/basket/domain/usecases/add_to_cart_use_case.dart';
import 'package:fruits_app/features/basket/domain/usecases/delete_cart_item_use_case.dart';
import 'package:fruits_app/features/basket/domain/usecases/get_cart_items_use_case.dart';
import 'package:fruits_app/features/basket/domain/usecases/update_cart_item_use_case.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_state.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartItemsUseCase getCartItemsUseCase;
  final AddToCartUseCase addToCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final UpdateCartItemUseCase updateCartQuantityUseCase;

  CartCubit({
    required this.getCartItemsUseCase,
    required this.addToCartUseCase,
    required this.removeFromCartUseCase,
    required this.updateCartQuantityUseCase,
  }) : super(CartInitial());

  void fetchCart() async {
    emit(CartLoading());
    try {
      final items = await getCartItemsUseCase();
      double total = items.fold(0, (sum, item) => sum + (item.price * item.cartQuantity));
      emit(CartLoaded(items, total));
    } catch (e) {
      emit(CartError('Failed to load the cart'));
    }
  }

  void addProduct(ProductEntity product) async {
    try {
      await addToCartUseCase(product);
      fetchCart();
    } catch (e) {
      emit(CartError('Failed to add product'));
    }
  }

  void deleteItem(int id) async {
    try {
      await removeFromCartUseCase(id);
      fetchCart();
    } catch (e) {
      emit(CartError('Failed to delete item'));
    }
  }

  void incrementQuantity(ProductEntity product) async {
    try {
      await updateCartQuantityUseCase(product.id, product.cartQuantity + 1);
      fetchCart();
    } catch (e) {
      emit(CartError('Update failed'));
    }
  }

  void decrementQuantity(ProductEntity product) async {
    try {
      if (product.cartQuantity > 1) {
        await updateCartQuantityUseCase(product.id, product.cartQuantity - 1);
        fetchCart();
      }
    } catch (e) {
      emit(CartError('Update failed'));
    }
  }
}
