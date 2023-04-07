import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/components/custom_text_field.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/constants/strings.dart';

class AccountBottom extends StatelessWidget {
  const AccountBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 56),
      color: AppColors.brown,
      height: height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //the first row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //First paper listings
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Paperless Listings",
                    style: GoogleFonts.oxygen(
                        color: AppColors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  Utils.verticalPadding(),
                  Text(
                    "Copyright@2022. All rights reserved.",
                    style: GoogleFonts.oxygen(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
              //Second row
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Services",
                    style: GoogleFonts.oxygen(
                        color: AppColors.pink,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  Utils.verticalPadding(),
                  Text(
                    "Home",
                    style: GoogleFonts.oxygen(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Utils.verticalPadding(),
                  Text(
                    "Explore",
                    style: GoogleFonts.oxygen(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Utils.verticalPadding(),
                  Text(
                    "FAQ",
                    style: GoogleFonts.oxygen(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Utils.verticalPadding(),
                  Text(
                    "Blog",
                    style: GoogleFonts.oxygen(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
              //Third row
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: GoogleFonts.oxygen(
                        color: AppColors.pink,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  Utils.verticalPadding(),
                  Text(
                    "About Us",
                    style: GoogleFonts.oxygen(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Utils.verticalPadding(),
                  Text(
                    "Contact us",
                    style: GoogleFonts.oxygen(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Utils.verticalPadding(),
                  Text(
                    "Term of use",
                    style: GoogleFonts.oxygen(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Utils.verticalPadding(),
                  Text(
                    "Privacy policy",
                    style: GoogleFonts.oxygen(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
              //button
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.pink),
                child: Center(
                  child: Icon(
                    Icons.arrow_drop_up_outlined,
                    color: AppColors.white,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Subscribe to our \nnewsletter",
                    style: GoogleFonts.oxygen(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  Utils.verticalPadding(),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.1,
                        child: CustomTextField(
                          hintText: "Email address",
                          hintFontSize: 12,
                          inputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          isOutlineBorder: false,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.emptyField;
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        height: 42,
                        width: 42,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6)),
                            color: AppColors.pink),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColors.white,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
                  Visibility(
                    visible: width > 1250,
                    child: SizedBox(
                      width: width > 1250 ? null : width * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/images/download_on_playstore.png"),
                          Image.asset("assets/images/download_on_appstore.png"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/facebook_white.png", width: 18, height: 18,),
                        Image.asset("assets/images/twitter.png",width: 18, height: 18,),
                        Image.asset("assets/images/instagram.png", width: 18, height: 18,),
                      ],
                    ),
                  ),

            ],
          )
        ],
      ),
    );
  }
}
