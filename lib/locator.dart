import 'package:baseproject/core/services/api.dart';
import 'package:baseproject/core/services/login_service.dart';
import 'package:baseproject/core/services/logout_service.dart';
import 'package:baseproject/core/services/order_service.dart';
import 'package:baseproject/core/viewmodels/home_viewmodel.dart';
import 'package:baseproject/core/viewmodels/login_viewmodel.dart';
import 'package:baseproject/core/viewmodels/splash_viewmodel.dart';
import 'package:baseproject/core/viewmodels/order_viewmodel.dart';
import 'package:baseproject/core/viewmodels/logout_viewmodel.dart';

import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => OrderService());
  locator.registerLazySingleton(() => LogoutService());
  // locator.registerLazySingleton(() => PushNotificationService());

  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => OrderViewModel());
  locator.registerFactory(() => LogoutViewModel());
}
