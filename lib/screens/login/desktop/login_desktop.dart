import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/components/custom_button.dart';
import 'package:paparless_tech_test/components/custom_text_field.dart';
import 'package:paparless_tech_test/config/locator.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/constants/strings.dart';
import 'package:paparless_tech_test/services/router_service.dart';
import 'package:paparless_tech_test/view_models/base_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/route.dart';

class LoginDesktop extends StatefulWidget {
  const LoginDesktop({Key? key}) : super(key: key);

  @override
  State<LoginDesktop> createState() => _LoginDesktopState();
}

class _LoginDesktopState extends State<LoginDesktop> {
  final router = locator<RouterService>();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<BaseProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              height: height,
              width: width * 0.55,
              child: Image.asset(
                AppIcons.kakumImage,
                fit: BoxFit.cover,
              )),
          Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.07, vertical: height * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Utils.verticalPadding(space: height * 0.07),
                Text(
                  AppStrings.welcome,
                  style: GoogleFonts.oxygen(
                      fontSize: 16,
                      color: AppColors.black
                  ),
                ),
                Text(
                  AppStrings.wlcMsg,
                  style: GoogleFonts.oxygen(
                      fontSize: 32,
                      color: AppColors.black,
                    fontWeight: FontWeight.bold

                  ),
                ),
                Utils.verticalPadding(space: 10),
                CustomTextField(
                  height: 50,
                  controller: vm.emailCtrl,
                  hintText: AppStrings.emailHint,
                  inputAction: TextInputAction.next,
                  labelFontSize: 16,
                  hintFontSize: 16,
                  title: AppStrings.email,
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
                  height: 50,
                  controller: vm.passwordCtrl,
                  title: AppStrings.password,
                  hintText: AppStrings.passwordHint,
                  inputAction: TextInputAction.done,
                  labelFontSize: 16,
                  hintFontSize: 16,
                  keyboardType: TextInputType.text,
                  isPasswordField: true,
                  validate: (value){
                    if (value!.isEmpty) {
                      return AppStrings.emptyField;
                    }
                    return null;
                  },
                ),
                Utils.verticalPadding(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppStrings.forgotPassword,
                    style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: AppColors.pink
                    ),
                  ),
                ),
                Utils.verticalPadding(),
                CustomButton(
                  title: AppStrings.loginBtnText,
                  titleColor: AppColors.white,
                  color: AppColors.pink,
                  titleSize: 16,
                  height: 0.05,
                  radius: 32,
                  onPressed: (){
                    router.push(AppRoutes.accountRoute);
                  },
                ),
                Utils.verticalPadding(space: 28),
                Align(
                  child: Text(
                    AppStrings.or.toUpperCase(),
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
                  titleSize: 16,
                  height: 0.05,
                  radius: 32,
                  onPressed: (){},
                ),
                Utils.verticalPadding(space: 24),
                CustomButton(
                  title: AppStrings.appleBtnText,
                  titleColor: AppColors.white,
                  color: AppColors.black,
                  icon: AppIcons.appleIcon,
                  titleSize: 16,
                  height: 0.05,
                  radius: 32,
                  onPressed: (){},
                ),
                Utils.verticalPadding(space: 24),
                CustomButton(
                  title: AppStrings.facebookBtnText,
                  titleColor: AppColors.white,
                  color: AppColors.fbBlue,
                  icon: AppIcons.fbIcon,
                  titleSize: 16,
                  height: 0.05,
                  radius: 32,
                  onPressed: (){},
                ),
                Utils.verticalPadding(space: 24),
                CustomButton(
                  title: AppStrings.twitterBtnText,
                  titleColor: AppColors.white,
                  color: AppColors.tBlue,
                  icon: AppIcons.twitterIcon,
                  titleSize: 16,
                  height: 0.05,
                  radius: 32,
                  onPressed: (){
                  },
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
              ))
        ],
      ),
    );
  }
}
