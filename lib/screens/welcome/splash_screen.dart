import 'package:chat/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // demo time it required to load inital data
    Future.delayed(
      Duration(seconds: 1),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? "assets/icons/Logo_dark_theme.svg"
              : "assets/icons/Logo_light_theme.svg",
        ),
      ),
    );
  }
}
