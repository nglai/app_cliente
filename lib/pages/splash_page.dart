import 'package:app_cliente/pages/login_page.dart';
import 'package:app_cliente/pages/menu_page.dart';
import 'package:app_cliente/widgets/splash_loading.dart';
import '../controllers/user_controller.dart';
import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'dart:async';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 3), () {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => LoginPage()),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(
      builder: (context, userController, child) {
        switch (userController.authState) {
          case AuthState.signed:
            return MenuPage();
          case AuthState.unsigned:
            return LoginPage();
          case AuthState.loading:
            return SplashLoadingWidget();
        }
      },
    );
  }
}
