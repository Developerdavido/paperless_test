import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/components/custom_button.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/constants/strings.dart';


class LaBrasserieTop extends StatefulWidget {
  const LaBrasserieTop({Key? key}) : super(key: key);

  @override
  State<LaBrasserieTop> createState() => _LaBrasserieTopState();
}

class _LaBrasserieTopState extends State<LaBrasserieTop> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/restaurant.jpg", height: width > 700 ? height * 0.7 : height* 0.3, width: width,fit: BoxFit.cover,),
              Positioned(
                top: 32,
                  left: 32,
                  right: 32,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "La Brassiere",
                        style: GoogleFonts.oxygen(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white
                        ),
                      ),
                      width > 800 ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const CustomButton(
                            title: "Call Now",
                            titleColor: AppColors.white,
                            radius: 32,
                            width: 0.12,
                            height: 0.04,
                            color: AppColors.pink,
                            titleSize: 12,
                          ),
                          Utils.horizontalPadding(),
                          const CustomButton(
                            title: "Direct Message",
                            titleColor: AppColors.white,
                            radius: 32,
                            width: 0.14,
                            height: 0.04,
                            color: AppColors.pink,
                            titleSize: 12,
                          )
                        ],
                      ) : Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.pink
                            ),
                            child: const Icon(Icons.call, color: Colors.white)
                          ),
                         Utils.horizontalPadding(),
                         Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.pink
                              ),
                              child: Icon(Icons.chat, color: Colors.white)
                          )
                        ],
                      )
                    ],
                  ) 
              ),
              Positioned(
                top: width > 500 ? height * 0.3 : height * 0.15,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(AppStrings.lTitle,
                        style: GoogleFonts.monsieurLaDoulaise(
                          fontSize: width > 700 ? 44 : 28,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Utils.verticalPadding(),
                      Text(AppStrings.lMessage,
                        style: GoogleFonts.oxygen(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white
                        ),
                        textAlign: TextAlign.center,
                      ),

                    ],
                  ))
            ],
          ),
          Container(
            color: AppColors.blueGrey,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
            child: Row(
              mainAxisAlignment: width > 700 ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Open now",
                  style: GoogleFonts.oxygen(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: AppColors.pink
                  ),
                ),
                width > 500 ? Utils.horizontalPadding(space: 12) : Container(),
                Column(
                  crossAxisAlignment:width > 700 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Tuesday - Wednesday",
                      style: GoogleFonts.oxygen(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: AppColors.black
                      ),
                    ),
                    Text(
                      "10 AM - 10 PM",
                      style: GoogleFonts.oxygen(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
