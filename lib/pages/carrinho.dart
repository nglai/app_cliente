import 'package:app_cliente/controllers/user_controller.dart';
import 'package:app_cliente/models/pedido_model.dart';
import 'package:app_cliente/pages/menu_page.dart';
import 'package:app_cliente/widgets/pruduto_carrinho_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../controllers/pedido_controller.dart';
import 'package:flutter/material.dart';

class Carrinho extends StatefulWidget {
  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );

  double valorTotal = 0.0;

  @override
  Widget build(BuildContext context) {
    pedidoController.pedido.forEach((element) {
      valorTotal = valorTotal + element['precoTotal'];
    });

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: AnimatedBuilder(
          animation: pedidoController,
          builder: (BuildContext context, Widget? child) {
            return pedidoController.pedido.isEmpty
                ? Center(
                    child: ProdutoCarrinhoWidget(),
                  )
                : ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      ProdutoCarrinhoWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Text(
                              'Valor total do pedido: R\$ ${valorTotal.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 70),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(157, 78, 221, 1),
                          ),
                          onPressed: () {
                            final novoPedido = PedidoModel(
                              clienteKey: userController.user!.uid,
                              produto: pedidoController.pedido,
                              clienteNome: userController.model.nome,
                            ).toMap();

                            FirebaseFirestore.instance
                                .collection('pedidos')
                                .add(novoPedido);

                            setState(() {
                              pedidoController.pedido.clear();
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MenuPage(),
                              ),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Pedido realizado com sucesso.'),
                              ),
                            );
                          },
                          child: Text('Finalizar pedido'),
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
