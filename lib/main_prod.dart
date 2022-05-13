import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/build_environment.dart';
import 'core/enums/build_enums.dart';
import 'locator.dart';
import 'main.dart';

Future<void> main() async {

  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await Firebase.initializeApp();
  Constants.setEnvironment(BuildEnvironment.PROD);
  runZonedGuarded(() {
    runApp(EasyLocalization(
        startLocale: Locale('en'),
        supportedLocales: [
          Locale('en'),
        ],
        path: 'assets/translations', // <-- change patch to your
        fallbackLocale: Locale('en'),
        child: MyApp()));
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.');
  });
}
