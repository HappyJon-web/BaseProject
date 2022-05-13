import 'package:baseproject/locale/app_localization.dart';
import 'package:baseproject/login.dart';
import 'package:baseproject/ui/splash_view.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  AppLocalizationDelegate _localeOverrideDelegate =
      AppLocalizationDelegate(Locale("en", "US"));
  @override
  Widget build(BuildContext context) {
    Logger.level = Level.verbose;
    final botToastBuilder = BotToastInit();

    return MaterialApp(
      navigatorObservers: [BotToastNavigatorObserver()],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        _localeOverrideDelegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
      ],
      title: 'Flutter Demo',
      builder: (BuildContext context, child) {
        child = botToastBuilder(context, child);
        return child;
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme:
            GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme).copyWith(
          headline1: GoogleFonts.ubuntu(
              fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
          headline2: GoogleFonts.ubuntu(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          headline3: GoogleFonts.ubuntu(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          headline4: GoogleFonts.openSans(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          headline5: GoogleFonts.openSans(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          subtitle1: GoogleFonts.ubuntu(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          subtitle2: GoogleFonts.openSans(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: GoogleFonts.openSans(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
          bodyText2: GoogleFonts.openSans(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.normal),
          button: GoogleFonts.ubuntu(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        appBarTheme: AppBarTheme(
            centerTitle: true,
            textTheme:
                TextTheme(headline6: Theme.of(context).textTheme.headline6),
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white)),
      ),
      home: SplashView(),
    );
  }
}
