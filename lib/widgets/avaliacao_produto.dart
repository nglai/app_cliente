import 'package:app_cliente/models/produto_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AvaliacaoProduto extends StatefulWidget {
  final String keyProduto;

  const AvaliacaoProduto({
    required this.keyProduto,
  });

  @override
  _AvaliacaoProdutoState createState() => _AvaliacaoProdutoState();
}

class _AvaliacaoProdutoState extends State<AvaliacaoProduto> {
  final activeColor = Colors.yellow;
  final inactiveColor = Colors.grey;

  int nota = 0;

  Icon starIcon(int mynota) =>
      Icon(Icons.star, color: nota >= mynota ? activeColor : inactiveColor);

  void setNota(int novaNota) {
    setState(() {
      nota = novaNota;
    });
  }

  String mapNota() {
    if (nota == 1) {
      return "1";
    } else if (nota == 2) {
      return "2";
    } else if (nota == 3) {
      return "3";
    } else if (nota == 4) {
      return "4";
    } else if (nota == 5) {
      return "5";
    } else {
      return "Clique para avaliar";
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.keyProduto);
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: FirebaseFirestore.instance
          .collection('produtos')
          .doc(widget.keyProduto)
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final produto = ProdutoModel.fromMap(snapshot.data!.data()!);

        return AlertDialog(
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      IconButton(
                          icon: starIcon(1), onPressed: () => setNota(1)),
                      IconButton(
                          icon: starIcon(2), onPressed: () => setNota(2)),
                      IconButton(
                          icon: starIcon(3), onPressed: () => setNota(3)),
                      IconButton(
                          icon: starIcon(4), onPressed: () => setNota(4)),
                      IconButton(
                          icon: starIcon(5), onPressed: () => setNota(5)),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    final updateProduto = ProdutoModel(
                      keyProduto: produto.keyProduto,
                      nome: produto.nome,
                      preco: produto.preco,
                      categoria: produto.categoria,
                      descricao: produto.descricao,
                      keyVendedor: produto.keyVendedor,
                      nomeVendedor: produto.nomeVendedor,
                      cor: produto.cor,
                      promocao: produto.promocao,
                      precoDesconto: produto.precoDesconto,
                      quantidade: produto.quantidade,
                      avaliacao: produto.avaliacao! + nota,
                      quantidadeAvaliacoes: produto.quantidadeAvaliacoes! + 1,
                      imagem: produto.imagem,
                    ).toMap();
                    await FirebaseFirestore.instance
                        .collection('produtos')
                        .doc(widget.keyProduto)
                        .update(updateProduto);
                    Navigator.pop(context, 'Avaliar');
                  },
                  child: const Text('Avaliar'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
