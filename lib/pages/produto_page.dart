import 'package:app_cliente/models/produto_pedido_model.dart';

import '../models/produto_model.dart';
import '../widgets/render_avaliacao_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/pedido_controller.dart';
import 'package:intl/intl.dart';

class ProdutoPage extends StatefulWidget {
  final ProdutoModel produto;
  final int? avaliacao;
  final int? qtAvaliacoes;

  ProdutoPage(this.produto, this.avaliacao, this.qtAvaliacoes);

  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  final data =
      DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, 'pt_Br').format(DateTime.now());
  late int quantidadeProdutos = 1;
  late double valorCompra = widget.produto.preco! * quantidadeProdutos;
  @override
  Widget build(BuildContext context) {
    var precoFinal;
    if (widget.produto.promocao == 'Sim') {
      precoFinal =
          (widget.produto.preco! - double.parse(widget.produto.precoDesconto!))
              .toStringAsFixed(2);
    }
    double valorCompra = double.parse(precoFinal) * quantidadeProdutos;
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
                widget.produto.imagem != null
                    ? Container(
                        width: 300,
                        height: 300,
                        child: Image.memory(
                          widget.produto.imagem!,
                          width: 72,
                          fit: BoxFit.contain,
                        ),
                      )
                    : Container(
                        child: Icon(Icons.no_photography),
                        width: 72,
                        height: double.maxFinite,
                        color: Colors.blue,
                      ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Text(
                          widget.produto.nome!,
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
                      widget.avaliacao, widget.qtAvaliacoes),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'R\$ ${precoFinal.toString()}',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Em até 10x R\$ ${(double.parse(precoFinal) / 10).toStringAsFixed(2).toString()} sem juros',
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
                          '${widget.produto.nomeVendedor}',
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
                                widget.produto.descricao!,
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
                      final produto = ProdutoPedidoModel(
                        nome: widget.produto.nome!,
                        preco: double.parse(precoFinal),
                        keyVendedor: widget.produto.keyVendedor!,
                        keyProduto: widget.produto.keyProduto,
                        nomeVendedor: widget.produto.nomeVendedor!,
                        cor: widget.produto.cor!,
                        imagem: widget.produto.imagem!,
                        precoTotal: valorCompra,
                        quantidadeProduto: quantidadeProdutos,
                        dataCompra: data,
                        categoria: widget.produto.categoria!,
                      ).toMap();
                      pedidoController.addProduto(produto);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Adicionar ao carrinho | R\$ $valorCompra',
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
