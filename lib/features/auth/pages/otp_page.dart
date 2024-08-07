import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:task_management_app/common/utils/constants.dart';
import 'package:task_management_app/common/widgets/app_style.dart';
import 'package:task_management_app/common/widgets/height_spacer.dart';
import 'package:task_management_app/common/widgets/reusable_text.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeightSpacer(height: AppConstants.kHeight * 0.12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  'assets/images/todo.png',
                  width: AppConstants.kWidth * 0.5,
                ),
              ),
              const HeightSpacer(height: 26),
              ReusableText(
                text: 'Enter your OTP code',
                style: appStyle(
                  18,
                  AppConstants.kLight,
                  FontWeight.bold,
                ),
              ),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (value) {
                  if (value.length == 6) {}
                },
                onSubmitted: (value) {
                  if (value.length == 6) {}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
