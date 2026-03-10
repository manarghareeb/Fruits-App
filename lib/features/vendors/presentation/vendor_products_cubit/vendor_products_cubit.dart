import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/vendors/domain/usecases/get_vendor_products_usecase.dart';
import 'package:fruits_app/features/vendors/presentation/vendor_products_cubit/vendor_products_state.dart';

class VendorProductsCubit extends Cubit<VendorProductsState> {
  final GetVendorProductsUsecase getVendorProductsUsecase;

  VendorProductsCubit({required this.getVendorProductsUsecase})
    : super(VendorProductsInitial());

  Future<void> getVendorProducts(int vendorId) async {
    emit(VendorProductsLoading());
    final result = await getVendorProductsUsecase(vendorId);
    result.fold(
      (failure) => emit(VendorProductsError(failure.message)),
      (vendors) => emit(VendorProductsSuccess(vendors)),
    );
  }
}
