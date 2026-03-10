import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/vendors/domain/entities/vendor_entity/vendor_entity.dart';
import 'package:fruits_app/features/vendors/domain/repositories/vendor_repository.dart';

class GetVendorsUsecase {
  final VendorRepository vendorRepository;

  GetVendorsUsecase({required this.vendorRepository});
  Future<Either<Failure, List<VendorEntity>>> call() async {
    return await vendorRepository.getVendors();
  }
}
