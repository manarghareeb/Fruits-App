import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/vendors/domain/usecases/get_vendors_usecase.dart';
import 'package:fruits_app/features/vendors/presentation/vendors_cubit/vendor_state.dart';

class VendorCubit extends Cubit<VendorState> {
  final GetVendorsUsecase getVendorsUseCase;

  VendorCubit({required this.getVendorsUseCase}) : super(VendorInitial());

  Future<void> getAllVendors() async {
    emit(VendorLoading());
    final result = await getVendorsUseCase();
    result.fold(
      (failure) => emit(VendorError(failure.message)),
      (vendors) => emit(VendorSuccess(vendors))
    );
  }
}
