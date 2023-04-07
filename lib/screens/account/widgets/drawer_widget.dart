import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/constants/constants.dart';

class DrawerItemWidget extends StatelessWidget {
  final DrawerItem? drawerItem;
  const DrawerItemWidget({Key? key, this.drawerItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(drawerItem?.data, size: 28, color: AppColors.black,),
      title: Text(
        drawerItem!.item!,
        style: GoogleFonts.oxygen(
          fontSize: 16,
          color: AppColors.black,
          fontWeight: FontWeight.w300
        ),
      ),
    );
  }
}
