import 'package:flutter/material.dart';

class Carrinho extends StatefulWidget {
  Carrinho({Key? key}) : super(key: key);

  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('carrinho'),
    );
  }
}