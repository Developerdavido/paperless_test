import 'package:flutter/material.dart';
import 'package:paparless_tech_test/screens/details/widgets/la_brassiere_body.dart';
import 'package:paparless_tech_test/screens/details/widgets/la_brassiere_top.dart';

class DetailsMobile extends StatefulWidget {
  const DetailsMobile({Key? key}) : super(key: key);

  @override
  State<DetailsMobile> createState() => _DetailsMobileState();
}

class _DetailsMobileState extends State<DetailsMobile> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: const [
              LaBrasserieTop(),
              LaBrassiereBody(),
            ],
          ),
        ),
      ),
    );
  }
}
