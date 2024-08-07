import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/common/utils/constants.dart';
import 'package:task_management_app/common/widgets/app_style.dart';
import 'package:task_management_app/common/widgets/custom_button.dart';
import 'package:task_management_app/common/widgets/height_spacer.dart';
import 'package:task_management_app/common/widgets/reusable_text.dart';
import 'package:task_management_app/features/auth/pages/otp_page.dart';

import '../../../common/widgets/custom_text_field.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phone = TextEditingController();
  Country country = Country(
    phoneCode: '1',
    countryCode: 'US',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'USA',
    example: 'USA',
    displayName: 'United States',
    displayNameNoCountryCode: 'US',
    e164Key: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(
                  'assets/images/todo.png',
                  width: 300,
                ),
              ),
              const HeightSpacer(height: 20),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 16.w),
                child: ReusableText(
                  text: 'Please, enter your phone number',
                  style: appStyle(17, AppConstants.kLight, FontWeight.w500),
                ),
              ),
              const HeightSpacer(height: 20),
              Center(
                child: CustomTextField(
                  controller: phone,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(4),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                              backgroundColor: AppConstants.kLight,
                              bottomSheetHeight: AppConstants.kHeight * 0.6,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppConstants.kRadius),
                                topRight: Radius.circular(AppConstants.kRadius),
                              )),
                          onSelect: (code) {
                            setState(() {});
                          },
                        );
                      },
                      child: ReusableText(
                        text: '${country.flagEmoji} + ${country.phoneCode}',
                        style:
                            appStyle(18, AppConstants.kBkDark, FontWeight.bold),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  hintText: 'Enter phone number',
                  hintStyle:
                      appStyle(16, AppConstants.kBkDark, FontWeight.w600),
                ),
              ),
              const HeightSpacer(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomButton(
                  width: AppConstants.kWidth * 0.85,
                  height: AppConstants.kHeight * 0.07,
                  color: AppConstants.kBkDark,
                  color2: AppConstants.kLight,
                  text: 'Send code',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OtpPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
