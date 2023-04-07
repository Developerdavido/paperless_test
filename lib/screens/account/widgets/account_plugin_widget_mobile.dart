import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/components/custom_button.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/models/plugin_model.dart';

class AccountPluginWidgetMobile extends StatefulWidget {
  final PluginModel? model;
  const AccountPluginWidgetMobile({Key? key, this.model}) : super(key: key);

  @override
  State<AccountPluginWidgetMobile> createState() => _AccountPluginWidgetMobileState();
}

class _AccountPluginWidgetMobileState extends State<AccountPluginWidgetMobile> {
  bool onPressed = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.blueGrey,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 45,
                  width: 45,
                  child: Image.asset(widget.model!.image!, fit: BoxFit.contain,)),
              Utils.horizontalPadding(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model?.title ?? "",
                      style: GoogleFonts.oxygen(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black
                      ),
                    ),
                    Utils.verticalPadding(space: 8),
                    Text(widget.model?.subTitle ?? "",
                      style: GoogleFonts.oxygen(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Utils.verticalPadding(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              onPressed ?  CustomButton(
                title: "Enable",
                width: 0.2,
                color: AppColors.pink,
                titleColor: AppColors.white,
                radius: 32,
                titleSize: 12,
                borderColor: AppColors.white,
                onPressed: (){
                  setState(() {
                    onPressed = !onPressed;
                  });
                },
              ) : CustomButton(
                title: "Disable",
                width: 0.2,
                color: AppColors.blueGrey,
                titleColor: AppColors.pink,
                radius: 32,
                titleSize: 12,
                hasBorders: true,
                borderColor: AppColors.pink,
                onPressed: (){
                  setState(() {
                    onPressed = !onPressed;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
