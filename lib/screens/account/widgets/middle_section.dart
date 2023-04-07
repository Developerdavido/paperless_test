import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/constants/color.dart';

class AccountMiddleSection extends StatefulWidget {
  const AccountMiddleSection({Key? key}) : super(key: key);

  @override
  State<AccountMiddleSection> createState() => _AccountMiddleSectionState();
}

class _AccountMiddleSectionState extends State<AccountMiddleSection> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.07,
      width: width,
      color: AppColors.lightPink,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
      child: Text(
        "Plugins",
        style: GoogleFonts.oxygen(
          fontSize: 18,
          color: AppColors.white
        ),
      ),
    );
  }
}
