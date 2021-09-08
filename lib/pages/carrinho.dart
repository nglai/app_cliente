import 'package:app_cliente/models/pedido_model.dart';
import 'package:app_cliente/widgets/pruduto_carrinho_widget.dart';
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
      body: AnimatedBuilder(
        animation: pedidoController,
        builder: (BuildContext context, Widget? child) {
          return pedidoController.pedido.isEmpty
              ? Center(
                  child: ProdutoCarrinhoWidget(),
                )
              : ListView(
                  children: [
                    ProdutoCarrinhoWidget(),
                    ElevatedButton(
                      onPressed: () {
                        final novoPedido = PedidoModel(
                          clienteKey: '1213',
                          pedido: pedidoController.pedido,
                          clienteNome: 'Teste',
                        ).toMap();

                        FirebaseFirestore.instance
                            .collection('pedidos')
                            .add(novoPedido);

                        setState(() {
                          pedidoController.pedido.clear();
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Pedido realizado com sucesso.'),
                          ),
                        );
                      },
                      child: Text('Finalizar pedido'),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
