import 'package:app_cliente/widgets/lista_destaques_widget.dart';
import 'package:app_cliente/widgets/promocao_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          PromocaoWidget(),
          // Listadestaques(),
        ],
      ),
    );
  }
}
