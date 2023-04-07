import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/components/custom_button.dart';
import 'package:paparless_tech_test/config/locator.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/constants/constants.dart';
import 'package:paparless_tech_test/constants/route.dart';
import 'package:paparless_tech_test/services/router_service.dart';


class AccountTopSection extends StatelessWidget {
  const AccountTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
      child: SizedBox(
        height: height * 0.05,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Paperless Listings",
              style: GoogleFonts.oxygen(
                color: AppColors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
            const Spacer(),
            Expanded(
              flex: width > 1100 ? 0 : 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    child: Row(
                      children:  NavItem.navItemList.map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: GestureDetector(
                          onTap: (){
                            final router = locator<RouterService>();
                            router.push(AppRoutes.detailsRoute);
                          },
                          child: Text(e.item!,
                            style: GoogleFonts.oxygen(
                                fontSize: 16,
                                color: AppColors.black
                            ),
                          ),
                        ),
                      )).toList(),
                    ),
                  ),
                  Utils.horizontalPadding(space: 20),
                  Visibility(
                    visible: width > 1350,
                    child: CustomButton(
                      title: "Add Listings",
                      radius: 32,
                      width: 0.12,
                      titleSize: 16,
                      color: AppColors.pink,
                      titleColor: AppColors.white,
                      onPressed: (){
                        final router = locator<RouterService>();
                        router.push(AppRoutes.kycRoute);
                      },
                    ),
                  )
                ]
              ),
            ),

          ],
        ),
      ),
    );
  }
}
