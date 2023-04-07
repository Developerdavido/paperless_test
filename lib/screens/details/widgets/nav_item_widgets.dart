import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/constants/color.dart';

class NavItemWidgets extends StatelessWidget {
  final String? title;
  const NavItemWidgets({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          title!,
          style: GoogleFonts.oxygen(
              fontSize: 44,
              fontWeight: FontWeight.bold,
              color: AppColors.pink),
        ));
  }
}
