import 'package:flutter/material.dart';
import 'package:flutterwasmaapp/UI/main_screen.dart';
import 'package:flutterwasmaapp/UI/map_screen.dart';
import 'package:flutterwasmaapp/UI/repositories_list_screen.dart';
import 'package:flutterwasmaapp/UI/splash_screen.dart';
import 'package:flutterwasmaapp/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wasma App',
      theme: Themes.defaultTheme,
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
