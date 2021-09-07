import 'package:app_cliente/models/pedido_model.dart';
import 'package:app_cliente/pages/pruduto_carrinho_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controllers/pedido_controller.dart';
import 'package:flutter/material.dart';

class Carrinho extends StatefulWidget {
  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pedidoController.pedido.isEmpty
            ? Center(
                child: ProdutoCarrinhoPage(),
              )
            : ListView(
                children: [
                  ProdutoCarrinhoPage(),
                  ElevatedButton(
                    onPressed: () {
                      final novoPedido = PedidoModel(
                        clienteKey: '1213',
                        pedido: pedidoController.pedido,
                      ).toMap();
                      FirebaseFirestore.instance
                          .collection('pedidos')
                          .add(novoPedido);

                      setState(() {
                        pedidoController.pedido.clear();
                      });

                      AlertDialog(
                        title: Text('Pedido realizado com sucesso.'),
                      );
                    },
                    child: Text('Finalizar pedido'),
                  ),
                ],
              ));
  }
}
