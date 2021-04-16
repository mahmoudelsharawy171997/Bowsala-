import 'package:bowsala/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: SignIn(),
      backgroundColor: Colors.white,
      image: Image.asset('assets/logo.png'),
      loaderColor: Color(0xff065492),
      photoSize: 100.0
    );
  }
}