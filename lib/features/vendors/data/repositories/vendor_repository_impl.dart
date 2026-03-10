import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/error/failures.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';
import 'package:fruits_app/features/vendors/data/data_sources/vendors_remote_data_source.dart';
import 'package:fruits_app/features/vendors/domain/entities/vendor_entity/vendor_entity.dart';
import 'package:fruits_app/features/vendors/domain/repositories/vendor_repository.dart';

class VendorRepositoryImpl implements VendorRepository {
  final VendorsRemoteDataSource remoteDataSource;

  VendorRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<VendorEntity>>> getVendors() async {
    try {
      final vendors = await remoteDataSource.getVendors();
      return Right(vendors);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getVendorProduct(
    int vendorId,
  ) async {
    try {
      final vendors = await remoteDataSource.getVendorProducts(vendorId);
      return Right(vendors);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
