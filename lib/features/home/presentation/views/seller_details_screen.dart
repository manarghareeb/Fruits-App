import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text('Fruit Market', style: AppStyles.font24BoldPrinaryColor),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.search, color: Colors.black, size: 25.sp,),
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
              Text('Categories', style: AppStyles.font18BoldBlackColor),
              SizedBox(height: 7.5.h),
              CategoryList(categoryImages: categoryImages),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Products', style: AppStyles.font18BoldBlackColor),
                  IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
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
