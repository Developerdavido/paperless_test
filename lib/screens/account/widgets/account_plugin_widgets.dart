import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/components/custom_button.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/models/plugin_model.dart';

class AccountPluginWidget extends StatefulWidget {
  final PluginModel? model;
  const AccountPluginWidget({Key? key, this.model}) : super(key: key);

  @override
  State<AccountPluginWidget> createState() => _AccountPluginWidgetState();
}

class _AccountPluginWidgetState extends State<AccountPluginWidget> {
  bool onPressed = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.spaceBetween ,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 45,
                  width: 45,
                  child: Image.asset(widget.model!.image!, fit: BoxFit.contain,)),
              Utils.horizontalPadding(),
              Column(
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
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black
                  ),),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              onPressed ?  CustomButton(
                title: "Enabled",
                width: width > 1450 ? 0.06 : 0.11,
                color: AppColors.pink,
                titleColor: AppColors.white,
                radius: 32,
                titleSize: 14,
                borderColor: AppColors.white,
                onPressed: (){
                  setState(() {
                    onPressed = !onPressed;
                  });
                },
              ) : CustomButton(
                title: "Disabled",
                width: width > 1450 ? 0.06 : 0.11,
                color: AppColors.white,
                titleColor: AppColors.pink,
                radius: 32,
                titleSize: 14,
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
