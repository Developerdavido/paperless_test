import 'package:flutter/material.dart';
import 'package:paparless_tech_test/components/responsive.dart';
import 'package:paparless_tech_test/screens/kyc/desktop/kyc_desktop.dart';
import 'package:paparless_tech_test/screens/kyc/mobile/kyc_mobile.dart';

class KYC extends StatelessWidget {
  const KYC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobile: KYCMobile(),
        desktop: KYCDesktop(),
      ),
    );
  }
}
