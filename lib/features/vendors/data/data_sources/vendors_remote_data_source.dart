import 'package:fruits_app/core/api/api_consumer.dart';
import 'package:fruits_app/core/api/end_ponits.dart';
import 'package:fruits_app/features/categories/data/models/product_model.dart';
import 'package:fruits_app/features/vendors/data/models/vendor_model/vendor_model.dart';

abstract class VendorsRemoteDataSource {
  Future<List<VendorModel>> getVendors();
  Future<List<ProductModel>> getVendorProducts(int vendorId);
}

class VendorsRemoteDataSourceImpl implements VendorsRemoteDataSource {
  final ApiConsumer apiConsumer;

  VendorsRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<VendorModel>> getVendors() async {
    final response = await apiConsumer.get(EndPoint.vendors);
    final List dataList = response['data']['data'];
    return dataList.map((json) => VendorModel.fromJson(json)).toList();
  }

  @override
  Future<List<ProductModel>> getVendorProducts(int vendorId) async {
    final response = await apiConsumer.get(
      EndPoint.getVendorProducts,
      queryParameters: {'vendor_id': vendorId},
    );
    final List dataList = response['data'];
    return dataList.map((json) => ProductModel.fromJson(json)).toList();
  }
}
