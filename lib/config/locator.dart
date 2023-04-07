



import 'package:get_it/get_it.dart';
import 'package:paparless_tech_test/services/app_http_service.dart';
import 'package:paparless_tech_test/services/http_service.dart';
import 'package:paparless_tech_test/services/router_service.dart';

GetIt locator = GetIt.instance;
void setUpLocator() {
  locator.registerLazySingleton<RouterService>(() => RouterService());
  locator.registerLazySingleton<HttpService>(() => HttpService());
  locator.registerLazySingleton<AppHttpService>(() => AppHttpService());
}