import 'package:app_cliente/controllers/pedido_controller.dart';
import 'package:app_cliente/models/produto_pedido_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class ProdutoCarrinhoWidget extends StatefulWidget {
  ProdutoCarrinhoWidget({Key? key}) : super(key: key);

  @override
  _ProdutoCarrinhoWidgetState createState() => _ProdutoCarrinhoWidgetState();
}

class _ProdutoCarrinhoWidgetState extends State<ProdutoCarrinhoWidget> {
  var msg;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount:
          pedidoController.pedido.isEmpty ? 1 : pedidoController.pedido.length,
      itemBuilder: (context, index) {
        var produto;
        if (pedidoController.pedido.isEmpty) {
          msg = 'Carrinho vazio';
        } else {
          produto = ProdutoPedidoModel.fromMap(pedidoController.pedido[index]);
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
                      produto.imagem != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 300,
                                  height: 300,
                                  child: Image.memory(
                                    produto.imagem!,
                                    width: 72,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              child: Icon(Icons.no_photography),
                              width: 72,
                              height: double.maxFinite,
                              color: Colors.blue,
                            ),
                      Text('${produto.nome}'),
                      InkWell(
                        onTap: () {
                          pedidoController
                              .removeProduto(pedidoController.pedido[index]);
                        },
                        child: FaIcon(
                          FontAwesomeIcons.solidTrashAlt,
                          size: 15,
                        ),
                      ),
                      // Text('${produto[index]['preco']}'),
                      // Text('${produto[index]['quantidadeProduto']}'),
                      // Text('${produto[index]['precoTotal']}'),
                      Text('${produto.preco}'),
                      Text('${produto.quantidadeProduto}'),
                      Text('${produto.precoTotal}'),
                    ],
                  );
          },
        );
      },
    );
  }
}
