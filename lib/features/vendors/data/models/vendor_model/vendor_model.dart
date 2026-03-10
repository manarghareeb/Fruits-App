import '../../../domain/entities/vendor_entity/vendor_entity.dart';

class VendorModel extends VendorEntity {
  const VendorModel({
    required super.id,
    required super.name,
    required super.nameEn,
    required super.image,
    required super.rate,
    required super.isOpened,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      nameEn: json['name_en'] ?? '',
      image: json['img'] ?? '',
      rate: json['rate'] ?? '0',
      isOpened: json['is_opened'] == 'Y',
    );
  }
}