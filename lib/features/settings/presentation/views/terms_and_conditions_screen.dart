import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        isLeading: true,
        title: 'Terms and Conditions',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.5.w, vertical: 23.h),
          child: Column(
            children: [
              Text(
                '''A Terms and Conditions agreement acts as 
a legal contractbetween you (the company)
and the user. 
It’s where you 
maintain your rights to exclude users from 
your app in the event that they abuse your 
website/app, set out the rules for 
using your service and note other important 
details and disclaimers.

Having a Terms and Conditions agreement is 
completely optional. No laws require you to 
have one. Not even the super-strict and 
wide-reaching General Data Protection 
Regulation (GDPR).

Your Terms and Conditions agreement will 
be uniquely yours. While some clauses are 
standard and commonly seen in pretty much 
every Terms and Conditions agreement, it’s 
up to you to set the rules and guidelines that
 the user must agree to.

Terms and Conditions agreements are also
known as Terms of Service or Terms of Use 
agreements. These terms are 
interchangeable, practically speaking. 
More rarely, it may be called something like 
an End User Services Agreement (EUSA).''',
                style: AppStyles.font18RegularBlackColor.copyWith(
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
