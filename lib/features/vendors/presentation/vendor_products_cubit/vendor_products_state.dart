import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';

abstract class VendorProductsState {}

class VendorProductsInitial extends VendorProductsState {}

class VendorProductsLoading extends VendorProductsState {}

class VendorProductsSuccess extends VendorProductsState {
  final List<ProductEntity> vendorProducts;

  VendorProductsSuccess(this.vendorProducts);
}

class VendorProductsError extends VendorProductsState {
  final String message;

  VendorProductsError(this.message);
}