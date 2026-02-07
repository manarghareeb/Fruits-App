import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/home/presentation/widgets/category_list.dart';
import 'package:fruits_app/features/home/presentation/widgets/product_card_item.dart';
import 'package:fruits_app/features/home/presentation/widgets/seller_card_item.dart';
import 'package:go_router/go_router.dart';

class SellerDetailsScreen extends StatefulWidget {
  const SellerDetailsScreen({super.key});

  @override
  State<SellerDetailsScreen> createState() => _SellerDetailsScreenState();
}

class _SellerDetailsScreenState extends State<SellerDetailsScreen> {
  final List<String> categoryImages = [
    AppImages.restaurant,
    AppImages.farm,
    AppImages.coffee,
    AppImages.pharmacy,
  ];

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Fruit Market',
        isLeading: true,
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.search,
              color: Colors.black,
              size: isLandscape ? 15.sp : 20.sp,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SellerCardItem(
                imagePath: AppImages.companyLogo,
                name: 'Seller name',
                deliveryInfo: 'Delivery : 40 to 60 Min',
              ),
              Text(
                'Categories',
                style: AppStyles.font18BoldBlackColor(context),
              ),
              SizedBox(height: 7.5.h),
              CategoryList(categoryImages: categoryImages),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Products',
                    style: AppStyles.font18BoldBlackColor(context),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.filter_list, size: 20.sp),
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (context, index) => SizedBox(height: 7.h),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRoute.productDetailsScreen);
                    },
                    child: const ProductCardItem(
                      imagePath: AppImages.fruitsImage,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
