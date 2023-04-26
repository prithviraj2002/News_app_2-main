import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:news_app_2/screens/login-screen.dart';
import 'package:news_app_2/screens/tab_bar_screen.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: const Text(
          "True Ink",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
        nextScreen: const LoginScreen());
  }
}
