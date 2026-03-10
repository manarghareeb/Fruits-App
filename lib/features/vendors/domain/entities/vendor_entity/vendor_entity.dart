import 'package:equatable/equatable.dart';

class VendorEntity extends Equatable {
  final int id;
  final String name;
  final String nameEn;
  final String image;
  final String rate;
  final bool isOpened;

  const VendorEntity({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.image,
    required this.rate,
    required this.isOpened,
  });

  @override
  List<Object?> get props => [id, name, nameEn, image];
}