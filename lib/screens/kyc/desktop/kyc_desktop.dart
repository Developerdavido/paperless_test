import 'package:flutter/material.dart';
import 'package:paparless_tech_test/screens/account/widgets/account_bottom.dart';
import 'package:paparless_tech_test/screens/account/widgets/top_section.dart';
import 'package:paparless_tech_test/screens/kyc/widgets/kyc_body.dart';

class KYCDesktop extends StatefulWidget {
  const KYCDesktop({Key? key}) : super(key: key);

  @override
  State<KYCDesktop> createState() => _KYCDesktopState();
}

class _KYCDesktopState extends State<KYCDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AccountTopSection(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  KYCBody(),
                 AccountBottom(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
