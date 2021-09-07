import 'package:app_cliente/models/produto_model.dart';
import 'package:app_cliente/widgets/render_avaliacao_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProdutosCategoriaPage extends StatefulWidget {
  final String categoria;

  const ProdutosCategoriaPage({
    required this.categoria,
  });

  @override
  _ProdutosCategoriaPageState createState() => _ProdutosCategoriaPageState();
}

class _ProdutosCategoriaPageState extends State<ProdutosCategoriaPage> {
  @override
  Widget build(BuildContext context) {
    bool todosProdutos;

    widget.categoria == 'Todos os produtos'
        ? todosProdutos = true
        : todosProdutos = false;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoria),
        backgroundColor: Color.fromRGBO(157, 78, 221, 1),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: todosProdutos
            ? FirebaseFirestore.instance.collection('produtos').snapshots()
            : FirebaseFirestore.instance
                .collection('produtos')
                .where('categoria', isEqualTo: widget.categoria)
                .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final produtos = snapshot.data!.docs.map((map) {
            final data = map.data();
            return ProdutoModel.fromMap(data, map.id);
          }).toList();

          return ListView.builder(
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              final produto = produtos[index];
              double avaliacao = 0.0;

              produto.avaliacao.forEach((element) {
                avaliacao += element;
              });

              avaliacao = (avaliacao / produto.avaliacao.length);

              return Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(10),
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: InkWell(
                            onTap: () {
                              print('clicou');
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Image.network(
                                    'https://images-americanas.b2w.io/produtos/01/00/img/3069544/7/3069544719_1GG.jpg'),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    produto.nome,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: RenderAvaliacaoWidget(
                                      avaliacao, produto.avaliacao.length),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    'R\$ ${produto.preco.toString()}',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    'Em até 10x s/ juros de R\$ ${(produto.preco / 10).toStringAsFixed(2).toString()}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
