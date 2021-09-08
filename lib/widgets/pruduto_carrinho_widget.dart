import 'package:app_cliente/controllers/pedido_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class ProdutoCarrinhoWidget extends StatefulWidget {
  ProdutoCarrinhoWidget({Key? key}) : super(key: key);

  @override
  _ProdutoCarrinhoWidgetState createState() => _ProdutoCarrinhoWidgetState();
}

class _ProdutoCarrinhoWidgetState extends State<ProdutoCarrinhoWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount:
          pedidoController.pedido.isEmpty ? 1 : pedidoController.pedido.length,
      itemBuilder: (context, index) {
        final pedido;
        if (pedidoController.pedido.isEmpty) {
          pedido = 'Carrinho vazio';
        } else {
          pedido = pedidoController.pedido[index];
        }
        return AnimatedBuilder(
          animation: pedidoController,
          builder: (BuildContext context, Widget? child) {
            return pedidoController.pedido.isEmpty
                ? Center(
                    child: Lottie.network(
                        'https://assets6.lottiefiles.com/temp/lf20_jzqS18.json'),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                          'https://images-americanas.b2w.io/produtos/01/00/img/3069544/7/3069544719_1GG.jpg'),
                      Text('${pedido['nome']}'),
                      InkWell(
                        onTap: () {
                          pedidoController.removeProduto(pedido);
                        },
                        child: FaIcon(
                          FontAwesomeIcons.solidTrashAlt,
                          size: 15,
                        ),
                      ),
                      Text('${pedido['preco']}'),
                      Text('${pedido['quantidade']}'),
                      Text('${pedido['precoTotal']}'),
                    ],
                  );
          },
        );
      },
    );
  }
}
