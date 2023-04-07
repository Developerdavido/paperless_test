import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/screens/details/widgets/faq_item.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(width > 600 ? "Frequently asked questions" : "FAQ",
            style: GoogleFonts.oxygen(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              color: AppColors.pink
            ),
          ),
          Utils.verticalPadding(space: 4),
          SizedBox(height: 12, width:width, child: const Divider(color: Colors.grey, thickness: 0.5,)),
          Utils.verticalPadding(),
          const FAQItem(
            number: "01",
            title: "Do they offer take away",
            subtitle: "Yes La Brasserie offers takeout services",
          ),
          const FAQItem(
            number: "01",
            title: "Do they accept mobile money payments",
            subtitle: "Yes La Brasserie accepts mobile money payment",
          ),

        ],
      ),
    );
  }
}
