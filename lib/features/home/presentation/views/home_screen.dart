import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_smooth_page_indicator.dart';
import 'package:fruits_app/features/home/presentation/widgets/category_list.dart';
import 'package:fruits_app/features/home/presentation/widgets/filter_widget.dart';
import 'package:fruits_app/features/home/presentation/widgets/seller_card_item.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController();
  int index = 0;

  final List<String> banners = [
    AppImages.banner,
    AppImages.banner,
    AppImages.banner,
    AppImages.banner,
  ];

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
      appBar: CustomAppBar(
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.search, color: Colors.black, size: 20.sp),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.sliders, color: Colors.black, size: 20.sp),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => const FilterWidget(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              SizedBox(
                height: 200.h,
                child: PageView.builder(
                  controller: controller,
                  itemCount: banners.length,
                  onPageChanged: (i) => setState(() => index = i),
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.asset(banners[i], fit: BoxFit.fill),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              CustomSmoothPageIndicator(
                controller: controller,
                count: banners.length,
              ),
              SizedBox(height: 16.h),
              CategoryList(categoryImages: categoryImages),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sellers', style: AppStyles.font18RegularBlackColor),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Show All',
                      style: AppStyles.font18RegularBlackColor.copyWith(
                        color: AppColors.blueColor,
                      ),
                    ),
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
                      GoRouter.of(context).push(AppRoute.sellerDetailsScreen);
                    },
                    child: const SellerCardItem(
                      imagePath: AppImages.companyLogo,
                      name: 'Seller name',
                      deliveryInfo: 'Delivery Charges : 0.5 KD',
                      distance: '2.5 KM',
                      category: 'Beverages',
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
