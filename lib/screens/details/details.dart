import 'package:flutter/material.dart';
import 'package:paparless_tech_test/components/responsive.dart';
import 'package:paparless_tech_test/screens/details/desktop/details_desktop.dart';
import 'package:paparless_tech_test/screens/details/mobile/details_mobile.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DetailsDesktop(),
    );
  }
}
