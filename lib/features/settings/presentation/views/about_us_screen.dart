import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:fruits_app/features/settings/presentation/cubit/settings_state.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'About Us', isLeading: true),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SettingsSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Center(child: Image.asset(AppImages.fruitsImage, height: 120.h)),
                    /*Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://fruits.sys-web.net/uploads/${state.settingsEntity.image}",
                          height: 120.h,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => SizedBox(
                            height: 120.h,
                            width: 120.w,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) {
                            debugPrint("Image Load Error: $error");
                            return Image.asset(
                              AppImages.fruitsImage,
                              height: 120.h,
                            );
                          },
                        ),
                      ),
                    ),*/
                    SizedBox(height: 16.h),
                    Text(
                      'Fruit Market',
                      style: AppStyles.font28BoldBlackColor(context),
                    ),
                    Text(
                      'Version 1.0.0',
                      style: AppStyles.font14RegularGreyColor(context),
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      state.settingsEntity.details,
                      textAlign: TextAlign.center,
                      style: AppStyles.font16RegularBlueColorUnderline(context)
                          .copyWith(
                            decoration: TextDecoration.none,
                            color: Colors.black,
                          ),
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            );
          } else if (state is SettingsFailure) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
