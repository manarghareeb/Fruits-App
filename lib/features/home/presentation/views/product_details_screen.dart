import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/home/presentation/widgets/custom_expandable_selection.dart';
import 'package:fruits_app/features/home/presentation/widgets/image_banner_section.dart';
import 'package:fruits_app/features/home/presentation/widgets/product_header_section.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String? selectedWeight;
  String? selectedAddons;
  bool isDropdownOpen = false;

  final List<String> weight = [
    '50 Gram - 4.00 KD',
    '1 Kg - 6.25 KD',
    '2 Kg - 12.00 KD',
  ];

  final List<String> addons = ['50 Gram - 4.00 KD', '1 Kg - 6.25 KD'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        isLeading: true,
        title: 'Product Name',
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 20.sp,
              color: Colors.black,
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRoute.buttonNavigatorBar, extra: 3);
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.shareFromSquare, color: Colors.black, size: 20.sp,),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 17.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageBannerSection(),
              SizedBox(height: 10.h),
              const ProductHeaderSection(),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: AppStyles.font16RegularDarkGreyColor,
              ),
              SizedBox(height: 14.h),
              Text(
                'Sell Per : Kartoon',
                style: AppStyles.font16RegularDarkGreyColor,
              ),
              SizedBox(height: 22.h),
              CustomExpandableSelection(
                title: 'Select Weight',
                list: weight,
                selectedItem: selectedWeight,
                onSelect: (value) {
                  setState(() {
                    selectedWeight = value;
                  });
                },
              ),
              SizedBox(height: 20.h),
              CustomExpandableSelection(
                title: 'Select Addons',
                list: addons,
                selectedItem: selectedAddons,
                onSelect: (value) {
                  setState(() {
                    selectedAddons = value;
                  });
                },
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButtonWidget(
                    width: 164.w,
                    icon: FontAwesomeIcons.basketShopping,
                    title: 'Add to Cart',
                    textStyle: AppStyles.font12SemiBoldWhiteColor.copyWith(
                      fontSize: 16.sp,
                    ),
                    onPressed: () {
                      GoRouter.of(context).push(AppRoute.buttonNavigatorBar, extra: 2,);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
