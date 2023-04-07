import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/constants/constants.dart';
import 'package:paparless_tech_test/screens/account/widgets/drawer_widget.dart';

Widget drawer = Drawer(
  elevation: 0,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    child: Column(
      children: [
        SizedBox(
            child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                "assets/images/lady_with_flag.png",
                fit: BoxFit.contain,
              ),
            ),
            Utils.verticalPadding(),
            Text(
              "Aundrey Nana",
              style: GoogleFonts.oxygen(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black),
            ),
            Utils.verticalPadding(space: 2),
            Text(
              "aundrey.nana@gmail.com",
              style: GoogleFonts.oxygen(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black),
            ),
          ],
        )),
        Utils.verticalPadding(space: 24),
        DrawerItemWidget(
          drawerItem: DrawerItem.drawerItemList[0],
        ),
        DrawerItemWidget(
          drawerItem: DrawerItem.drawerItemList[1],
        ),
        DrawerItemWidget(
          drawerItem: DrawerItem.drawerItemList[2],
        ),
        DrawerItemWidget(
          drawerItem: DrawerItem.drawerItemList[3],
        ),
        DrawerItemWidget(
          drawerItem: DrawerItem.drawerItemList[4],
        ),
      ],
    ),
  ),
);
