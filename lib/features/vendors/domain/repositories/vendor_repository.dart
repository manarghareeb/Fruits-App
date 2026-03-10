import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';
import 'package:fruits_app/features/vendors/domain/entities/vendor_entity/vendor_entity.dart';

abstract class VendorRepository {
  Future<Either<Failure, List<VendorEntity>>> getVendors();
  Future<Either<Failure, List<ProductEntity>>> getVendorProduct(int vendorId);
}
