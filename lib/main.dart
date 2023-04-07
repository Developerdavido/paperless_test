import 'package:flutter/material.dart';
import 'package:paparless_tech_test/config/locator.dart';
import 'package:paparless_tech_test/config/router.dart' as route;
import 'package:paparless_tech_test/constants/route.dart';
import 'package:paparless_tech_test/services/router_service.dart';
import 'package:paparless_tech_test/view_models/base_provider.dart';
import 'package:provider/provider.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BaseProvider>.value(value: BaseProvider(),
      child: MaterialApp(
        title: 'Paperless Listings',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        navigatorKey: locator<RouterService>().navigatorKey,
        onGenerateRoute: route.generateRoute,
        initialRoute: AppRoutes.loginRoute,
      ),
    );
  }
}

