import 'package:flutter/material.dart';
import 'package:flutterwasmaapp/UI/main_screen.dart';
import 'package:flutterwasmaapp/UI/map_screen.dart';
import 'package:flutterwasmaapp/UI/repositories_list_screen.dart';
import 'package:flutterwasmaapp/UI/splash_screen.dart';
import 'package:flutterwasmaapp/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() =>
    runApp(EasyLocalization(path: 'assets/langauge',
        supportedLocales: <Locale>[ Locale('ar', 'DZ'),
          Locale('en', 'US'),
        ],
        child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wasma App',
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      theme: Themes.defaultTheme,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          EasyLocalization.of(context).delegate,
        ],
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        MainScreen.id: (BuildContext context) => MainScreen(),
        MapScreen.id: (BuildContext context) => MapScreen(),
        RepositoriesListScreen.id: (BuildContext context) =>
            RepositoriesListScreen(),
      },
    );
  }
}
