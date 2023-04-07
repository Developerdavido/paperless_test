import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/components/custom_button.dart';
import 'package:paparless_tech_test/components/custom_text_field.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/constants/drawer.dart';
import 'package:paparless_tech_test/constants/strings.dart';
import 'package:paparless_tech_test/models/plugin_model.dart';
import 'package:paparless_tech_test/screens/account/widgets/account_plugin_widgets.dart';


class AccountBody extends StatefulWidget {
  const AccountBody({Key? key}) : super(key: key);

  @override
  State<AccountBody> createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {

  bool onPressed = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //drawer
        Container(
          color: AppColors.white,
          height: height * 0.9,
            width: width > 1200 ? width * 0.15 : width * 0.2,
            child: drawer),
        //middle portion
        Flexible(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("General",
                  style: GoogleFonts.oxygen(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Utils.verticalPadding(space: 4),
                SizedBox(height: 12, width:width, child: const Divider(color: Colors.grey, thickness: 1,)),
                Utils.verticalPadding(),
                AccountPluginWidget(
                  model: PluginModel.myPlugins[0],
                ),
                Utils.verticalPadding(),
                AccountPluginWidget(
                  model: PluginModel.myPlugins[1],
                ),
                Utils.verticalPadding(),
                AccountPluginWidget(
                  model: PluginModel.myPlugins[2],
                ),
                Utils.verticalPadding(),
                AccountPluginWidget(
                  model: PluginModel.myPlugins[3],
                ),
                Utils.verticalPadding(),
                AccountPluginWidget(
                  model: PluginModel.myPlugins[4],
                ),
                Utils.verticalPadding(space: 50),
                Text("Unique",
                  style: GoogleFonts.oxygen(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Utils.verticalPadding(space: 4),
                SizedBox(height: 12, width:width, child: const Divider(color: Colors.grey, thickness: 1,)),
                Utils.verticalPadding(),
                AccountPluginWidget(
                  model: PluginModel.myPlugins[5],
                )

              ],
            ),
          ),
        ),
        //Ending portion
        Visibility(
          visible: width > 1200,
          child: Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 32, right: 32, bottom: 200),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.pink.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.need,
                      style: GoogleFonts.oxygen(
                          fontSize: 24,
                          fontWeight: FontWeight.w800
                      ),
                    ),
                    Utils.verticalPadding(),
                    Text(AppStrings.needMsg,
                      style: GoogleFonts.oxygen(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Utils.verticalPadding(),
                    CustomTextField(
                      height: 120,
                      title: "Feature request",
                      hintText: "Briefly describe what you want",
                      inputAction: TextInputAction.done,
                      labelFontSize: 16,
                      hintFontSize: 16,
                      maxLines: 8,
                      minLines: 8,
                      filled: true,
                      fillColor: AppColors.white,
                      borderColor: Colors.transparent,
                      keyboardType: TextInputType.text,
                      validate: (value){
                        if (value!.isEmpty) {
                          return AppStrings.emptyField;
                        }
                        return null;
                      },
                    ),
                    Utils.verticalPadding(),
                    CustomButton(
                      title: "Send",
                      width: 0.1,
                      color: AppColors.pink,
                      titleColor: AppColors.white,
                      radius: 32,
                      titleSize: 14,
                      borderColor: AppColors.white,
                      onPressed: (){
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }


}
