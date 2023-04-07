import 'package:flutter/material.dart';
import 'package:paparless_tech_test/screens/account/widgets/account_bottom.dart';
import 'package:paparless_tech_test/screens/details/widgets/la_brassiere_body.dart';
import 'package:paparless_tech_test/screens/details/widgets/la_brassiere_top.dart';

class DetailsDesktop extends StatefulWidget {
  const DetailsDesktop({Key? key}) : super(key: key);

  @override
  State<DetailsDesktop> createState() => _DetailsDesktopState();
}

class _DetailsDesktopState extends State<DetailsDesktop> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children:  [
              const LaBrasserieTop(),
              const LaBrassiereBody(),
              Visibility(
                visible: width > 700,
                  child: const AccountBottom()),
            ],
          ),
        ),
      ),
    );
  }
}
