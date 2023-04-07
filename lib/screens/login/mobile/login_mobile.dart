import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/components/custom_button.dart';
import 'package:paparless_tech_test/components/custom_text_field.dart';
import 'package:paparless_tech_test/config/locator.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/constants/route.dart';
import 'package:paparless_tech_test/constants/strings.dart';
import 'package:paparless_tech_test/services/router_service.dart';
import 'package:paparless_tech_test/view_models/base_provider.dart';
import 'package:provider/provider.dart';


class LoginMobile extends StatefulWidget {
  const LoginMobile({Key? key}) : super(key: key);

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {

  final router = locator<RouterService>();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<BaseProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: width > 650 ? const EdgeInsets.symmetric(horizontal: 80, vertical: 80) : const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.1,),
              CustomTextField(
                controller: vm.emailCtrl,
                hintText: AppStrings.emailHint,
                inputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                validate: (value){
                  if (value!.isEmpty) {
                    return AppStrings.emptyField;
                  }
                  return null;
                },

              ),
              Utils.verticalPadding(),
              CustomTextField(
                controller: vm.passwordCtrl,
                hintText: AppStrings.passwordHint,
                inputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                isPasswordField: true,
                validate: (value){
                  if (value!.isEmpty) {
                    return AppStrings.emptyField;
                  }
                  return null;
                },
              ),
              Utils.verticalPadding(space: 20),
              Text(
                AppStrings.forgotPassword,
                style: GoogleFonts.oxygen(
                  fontSize: 18,
                  color: AppColors.pink
                ),
              ),
              Utils.verticalPadding(space: 32),
              CustomButton(
                title: AppStrings.loginBtnText,
                titleColor: AppColors.white,
                color: AppColors.pink,
                height: 0.07,
                radius: 32,
                onPressed: (){
                  router.push(AppRoutes.accountRoute);
                },
              ),
              Utils.verticalPadding(space: 28),
              Align(
                child: Text(
                  AppStrings.or,
                  style: GoogleFonts.oxygen(
                      fontSize: 14,
                      color: AppColors.black
                  ),
                ),
              ),
              Utils.verticalPadding(space: 32),
              CustomButton(
                title: AppStrings.googleBtnText,
                hasBorders: true,
                titleColor: AppColors.black,
                color: Colors.transparent,
                icon: AppIcons.googleIcon,
                height: 0.07,
                radius: 32,
                onPressed: (){},
              ),
              Utils.verticalPadding(space: 24),
              CustomButton(
                title: AppStrings.appleBtnText,
                titleColor: AppColors.white,
                color: AppColors.black,
                icon: AppIcons.appleIcon,
                height: 0.07,
                radius: 32,
                onPressed: (){},
              ),
              Utils.verticalPadding(space: 24),
              CustomButton(
                title: AppStrings.facebookBtnText,
                titleColor: AppColors.white,
                color: AppColors.fbBlue,
                icon: AppIcons.fbIcon,
                height: 0.07,
                radius: 32,
                onPressed: (){},
              ),
              Utils.verticalPadding(space: 24),
              CustomButton(
                title: AppStrings.twitterBtnText,
                titleColor: AppColors.white,
                color: AppColors.tBlue,
                icon: AppIcons.twitterIcon,
                height: 0.07,
                radius: 32,
                onPressed: (){},
              ),
              Utils.verticalPadding(space: 24),
              Align(
                child: RichText(text: TextSpan(
                  style: GoogleFonts.oxygen(fontSize: 14, color: AppColors.black),
                  children: [
                    const TextSpan(text: AppStrings.noAccountTxt),
                    TextSpan(text: AppStrings.joinTxt, style: GoogleFonts.oxygen(fontSize: 14, color: AppColors.pink))
                  ]
                )),
              )
            ],
          ),
        ),
      )
    );
  }
}
