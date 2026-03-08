import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';
import 'package:fruits_app/features/home/presentation/widgets/product_header_section.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  @override
  Widget build(BuildContext context) {
    /*String? selectedWeight;
    String? selectedAddons;

    final List<String> weight = [
      '50 Gram - 4.00 KD',
      '1 Kg - 6.25 KD',
      '2 Kg - 12.00 KD',
    ];

    final List<String> addons = ['50 Gram - 4.00 KD', '1 Kg - 6.25 KD'];*/
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        ProductHeaderSection(
          productName: widget.productEntity.nameEn, 
          categoryName: widget.productEntity.nameCategoryEn, 
          priceAfterDiscount: '',
          priceBeforeDiscount: '${widget.productEntity.price}',
        ),
        SizedBox(height: 8.h),
        Text(
          widget.productEntity.detailsEn,
          style: AppStyles.font16RegularDarkGreyColor(context),
        ),
        SizedBox(height: 14.h),
        /*Text(
          'Sell Per : Kartoon',
          style: AppStyles.font16RegularDarkGreyColor(context),
        ),
        SizedBox(height: 22.h),*/
        /*CustomExpandableSelection(
          title: 'Select weight',
          list: weight,
          selectedItem: selectedWeight,
          onSelect: (value) => setState(() => selectedWeight = value),
        ),
        SizedBox(height: 15.h),
        CustomExpandableSelection(
          title: 'Select Addons',
          list: addons,
          selectedItem: selectedAddons,
          onSelect: (value) => setState(() => selectedAddons = value),
        ),*/
        SizedBox(height: 25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              width: 164.w,
              height: 45.h,
              icon: FontAwesomeIcons.basketShopping,
              title: 'Add to Cart',
              textStyle: AppStyles.font12SemiBoldWhiteColor(context),
              onPressed: () {
                GoRouter.of(
                  context,
                ).push(AppRoute.buttonNavigatorBar, extra: 2);
              },
            ),
          ],
        ),
      ],
    );
  }
}
