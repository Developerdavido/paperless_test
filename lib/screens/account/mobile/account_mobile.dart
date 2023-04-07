import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/constants/drawer.dart';
import 'package:paparless_tech_test/models/plugin_model.dart';
import 'package:paparless_tech_test/screens/account/widgets/account_plugin_widget_mobile.dart';


class AccountMobile extends StatefulWidget {
  const AccountMobile({Key? key}) : super(key: key);

  @override
  State<AccountMobile> createState() => _AccountMobileState();
}

class _AccountMobileState extends State<AccountMobile> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      endDrawer: drawer,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Paperless Listings",
            style: GoogleFonts.oxygen(
                color: AppColors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
        ),
        leadingWidth: 24,
        actions: [
          Builder(builder: (BuildContext context) {
            return IconButton(onPressed: (){
              Scaffold.of(context).openEndDrawer();
            }, icon: Icon(Icons.menu, color: AppColors.black, size: 28,),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Account",
                    style: GoogleFonts.oxygen(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  Utils.verticalPadding(space: 4),
                  const Icon(Icons.arrow_forward_ios, color: AppColors.black, size: 10,),
                  Utils.verticalPadding(space: 4),
                  Text("Plugins",
                    style: GoogleFonts.oxygen(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
              Utils.verticalPadding(),
              Text("General",
                style: GoogleFonts.oxygen(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              ),
              Utils.verticalPadding(space: 4),
              SizedBox(height: 12, width:width, child: const Divider(color: Colors.grey, thickness: 1,)),
              Utils.verticalPadding(),
              AccountPluginWidgetMobile(
                model: PluginModel.myPlugins[0],
              ),
              Utils.verticalPadding(),
              AccountPluginWidgetMobile(
                model: PluginModel.myPlugins[1],
              ),
              Utils.verticalPadding(),
              AccountPluginWidgetMobile(
                model: PluginModel.myPlugins[2],
              ),
              Utils.verticalPadding(),
              AccountPluginWidgetMobile(
                model: PluginModel.myPlugins[3],
              ),
              Utils.verticalPadding(),
              AccountPluginWidgetMobile(
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
              AccountPluginWidgetMobile(
                model: PluginModel.myPlugins[5],
              )

            ],
          ),
        ),
      ),

    );
  }
}
