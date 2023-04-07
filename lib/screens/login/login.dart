import 'package:flutter/material.dart';
import 'package:paparless_tech_test/components/responsive.dart';
import 'package:paparless_tech_test/screens/login/desktop/login_desktop.dart';
import 'package:paparless_tech_test/screens/login/mobile/login_mobile.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobile: LoginMobile(),
        desktop: LoginDesktop(),
      ),
    );
  }
}
