import '../models/produto_model.dart';
import '../widgets/render_avaliacao_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/pedido_controller.dart';

class ProdutoPage extends StatefulWidget {
  final ProdutoModel produto;
  final double avaliacao;
  final int qtAvaliacoes;

  ProdutoPage(this.produto, this.avaliacao, this.qtAvaliacoes);

  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  late int quantidadeProdutos = 1;
  @override
  Widget build(BuildContext context) {
    double valorTotal = widget.produto.preco;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(157, 78, 221, 1),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                    'https://images-americanas.b2w.io/produtos/01/00/img/3069544/7/3069544719_1GG.jpg'),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Text(
                          widget.produto.nome,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantidadeProdutos > 1
                                    ? quantidadeProdutos -= 1
                                    : quantidadeProdutos = 1;
                              });
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.minusCircle,
                              color: Color.fromRGBO(157, 78, 221, 1),
                            ),
                          ),
                          Text('$quantidadeProdutos'),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantidadeProdutos += 1;
                              });
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.plusCircle,
                              color: Color.fromRGBO(157, 78, 221, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: RenderAvaliacaoWidget(
                      widget.avaliacao, widget.produto.avaliacao.length),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'R\$ ${widget.produto.preco.toString()}',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Em até 10x R\$ ${(widget.produto.preco / 10).toStringAsFixed(2).toString()} sem juros',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Text(
                        'Vendido e entregue por ',
                        style: TextStyle(fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          '${widget.produto.vendedor}',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueAccent,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Informações sobre o produto',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(157, 78, 221, 1),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                widget.produto.descricao,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(157, 78, 221, 1),
                    )),
                    onPressed: () {
                      final produto = {
                        'nome': widget.produto.nome,
                        'preco': widget.produto.preco,
                        'quantidade': quantidadeProdutos,
                        'keyVendedor': widget.produto.keyVendedor,
                        'keyCliente': 'keyClienteTeste',
                        'nomeVendedor': widget.produto.vendedor,
                        'nomeCliente': 'nomeClienteTeste',
                        'precoTotal': (valorTotal * quantidadeProdutos),
                      };

                      pedidoController.addProduto(produto);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Adicionar ao carrinho | R\$ ${valorTotal * quantidadeProdutos}',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
