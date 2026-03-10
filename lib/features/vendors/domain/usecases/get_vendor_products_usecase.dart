import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';
import 'package:fruits_app/features/vendors/domain/repositories/vendor_repository.dart';

class GetVendorProductsUsecase {
  final VendorRepository vendorRepository;

  GetVendorProductsUsecase({required this.vendorRepository});

  Future<Either<Failure, List<ProductEntity>>> call(int vendorId) async {
    return await vendorRepository.getVendorProduct(vendorId);
  }
}
