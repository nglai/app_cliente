import 'dart:async';
import 'package:app_cliente/pages/splash_page.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SplashPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/eletron2.gif",
                  width: 110,
                  height: 500,
                  // fit: BoxFit.fill,
                ),
              ],
            ),
            // LinearProgressIndicator(
            //   color: Color(0xFF9d4edd),
            // ),
          ],
        ),
      ),
    );
  }
}
