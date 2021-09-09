import 'package:app_cliente/controllers/user_controller.dart';
import 'package:app_cliente/widgets/splash_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'login_pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(builder: (context, userController, child) {
      switch (userController.authState) {
        case AuthState.signed:
          return HomePage();
        case AuthState.unsigned:
          return LoginPage();
        case AuthState.loading:
          return SplashLoadingWidget();
      }
    });
  }
}
