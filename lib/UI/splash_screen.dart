import 'package:flutter/material.dart';
import 'package:flutterwasmaapp/UI/main_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _startSplashScreenTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Center(
              child: Text(
                'Wasma APP ',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 50,
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).backgroundColor),
              )),
        ),
      ),
    );
  }

  _navigateToMainScreen() {
    Navigator.pushReplacementNamed(context, MainScreen.id);
  }

  _startSplashScreenTimer() {
    final duration = Duration(seconds: 2);
    Timer(duration, _navigateToMainScreen);
  }


}