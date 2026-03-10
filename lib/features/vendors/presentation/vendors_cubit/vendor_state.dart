import 'package:fruits_app/features/vendors/domain/entities/vendor_entity/vendor_entity.dart';

abstract class VendorState {}

class VendorInitial extends VendorState {}

class VendorLoading extends VendorState {}

class VendorSuccess extends VendorState {
  final List<VendorEntity> vendors;

  VendorSuccess(this.vendors);
}

class VendorError extends VendorState {
  final String message;

  VendorError(this.message);
}