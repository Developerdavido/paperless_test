
import 'package:flutter/material.dart';
import 'package:paparless_tech_test/constants/route.dart';
import 'package:paparless_tech_test/screens/details/details.dart';
import 'package:paparless_tech_test/screens/kyc/kyc.dart';
import 'package:paparless_tech_test/screens/login/login.dart';

import '../screens/account/account.dart';

Route<dynamic> generateRoute(RouteSettings settings) {

  switch(settings.name) {
    case AppRoutes.loginRoute:
      return MaterialPageRoute(builder: (context) => const Login());
    case AppRoutes.accountRoute:
      return MaterialPageRoute(builder: (context) => const Account());
    case AppRoutes.kycRoute:
      return MaterialPageRoute(builder: (context) => const KYC());
    case AppRoutes.detailsRoute:
      return MaterialPageRoute(builder: (context) => const Details());
      
    default:
      return MaterialPageRoute(builder: (context) => const Login());
  }

}