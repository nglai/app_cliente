import 'package:flutter/material.dart';

class SplashLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset(
                "assets/eletron2.gif",
                // width: 110,
                // height: 150,
                // fit: BoxFit.fill,
              ),
            ],
          ),
          LinearProgressIndicator(
            color: Color(0xFF9d4edd),
          ),
        ],
      ),
    );
  }
}
