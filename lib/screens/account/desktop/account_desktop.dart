import 'package:flutter/material.dart';
import 'package:paparless_tech_test/screens/account/widgets/account_bottom.dart';
import 'package:paparless_tech_test/screens/account/widgets/body.dart';
import 'package:paparless_tech_test/screens/account/widgets/middle_section.dart';
import 'package:paparless_tech_test/screens/account/widgets/top_section.dart';


class AccountDesktop extends StatefulWidget {
  const AccountDesktop({Key? key}) : super(key: key);

  @override
  State<AccountDesktop> createState() => _AccountDesktopState();
}

class _AccountDesktopState extends State<AccountDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AccountTopSection(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: const [
                  AccountMiddleSection(),
                  AccountBody(),
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
