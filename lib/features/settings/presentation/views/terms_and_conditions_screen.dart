import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:fruits_app/features/settings/presentation/cubit/settings_state.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(isLeading: true, title: 'Terms and Conditions'),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) return const Center(child: CircularProgressIndicator());
          if (state is SettingsSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.5.w, vertical: 23.h),
                child: Text(
                  state.settingsEntity.details, 
                  style: AppStyles.font18RegularBlackColor(context).copyWith(
                    fontSize: isLandscape ? 16.sp : 20.sp,
                  ),
                ),
              ),
            );
          }
          return const Center(child: Text('Failed to load terms'));
        },
      ),
    );
  }
}
