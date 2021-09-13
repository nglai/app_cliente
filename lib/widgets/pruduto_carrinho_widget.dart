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
                            spreadRadius: 2,
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
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Image.memory(
                                          produto.imagem!,
                                          width: 72,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(Icons.no_photography),
                                  width: 72,
                                  height: double.maxFinite,
                                  color: Colors.blue,
                                ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(245, 243, 244, 1),
                            ),
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Produto: ',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Color.fromRGBO(157, 78, 221, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          '${produto.nome}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(
                                                  33, 37, 41, 1)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Preço por unidade: ',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Color.fromRGBO(157, 78, 221, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          'R\$ ${produto.preco}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(
                                                  33, 37, 41, 1)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Quantidade: ',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Color.fromRGBO(157, 78, 221, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          '${produto.quantidadeProduto}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(
                                                  33, 37, 41, 1)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Preço total: ',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Color.fromRGBO(157, 78, 221, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        'R\$${produto.precoTotal}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Color.fromRGBO(33, 37, 41, 1)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: InkWell(
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
                                          FontAwesomeIcons.trashAlt,
                                          size: 18,
                                          color:
                                              Color.fromRGBO(157, 78, 221, 1),
                                        ),
                                      ),
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
