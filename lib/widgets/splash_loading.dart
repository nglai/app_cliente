import 'dart:async';

import 'package:flutter/material.dart';

class SplashLoadingWidget extends StatelessWidget {
  get image => null;

  void Function()? get handleTimeout => null;

  startTimeout() async {
    var duration = const Duration(seconds: 10);
    return new Timer(duration, handleTimeout!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/eletron2.gif'),
            LinearProgressIndicator(
              color: Color(0xFF9d4edd),
            ),
          ],
        ),
      ),
    );
  }
}
