import 'package:flutter/material.dart';
import 'package:paparless_tech_test/components/responsive.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/screens/account/desktop/account_desktop.dart';
import 'package:paparless_tech_test/screens/account/mobile/account_mobile.dart';


class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blueGrey,
      body: ResponsiveLayout(
        mobile: AccountMobile(),
        desktop: AccountDesktop(),
      ),
    );
  }
}
