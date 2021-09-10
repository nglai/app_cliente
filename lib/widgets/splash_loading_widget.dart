import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.flight_takeoff),
              Icon(Icons.favorite),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Diário de viagens'),
          ),
          // CircularProgressIndicator(
          //   backgroundColor: Colors.red,
          // )
          Lottie.network(
              'https://assets7.lottiefiles.com/packages/lf20_9zddpfah.json'),
        ],
      ),
    );
  }
}
