import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}
class CartLoading extends CartState {}
class CartLoaded extends CartState {
  final List<ProductEntity> products;
  final double totalPrice;
  CartLoaded(this.products, this.totalPrice);
}
class CartError extends CartState {
  final String message;
  CartError(this.message);
}