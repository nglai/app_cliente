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
          produto = ProdutoPedidoModel.fromMap(pedidoController.pedido[index],
              pedidoController.pedido[index]['keyProduto']);
        }
        return AnimatedBuilder(
          animation: pedidoController,
          builder: (BuildContext context, Widget? child) {
            return pedidoController.pedido.isEmpty
                ? Center(
                    child: Lottie.network(
                        'https://assets6.lottiefiles.com/temp/lf20_jzqS18.json'),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
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
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(224, 170, 255, 1),
                            ),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text(
                                            'Produto: ',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            '${produto.nome}',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        pedidoController.removeProduto(
                                            pedidoController.pedido[index]);

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text('Produto removido'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      },
                                      child: FaIcon(
                                        FontAwesomeIcons.solidTrashAlt,
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Preço por unidade: ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      'R\$ ${produto.preco}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Quantidade: ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      '${produto.quantidadeProduto}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Preço total: ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      'R\$${produto.precoTotal}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
