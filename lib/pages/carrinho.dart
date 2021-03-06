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

  @override
  Widget build(BuildContext context) {
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
