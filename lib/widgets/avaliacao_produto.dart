import 'package:flutter/material.dart';

class AvaliacaoProduto extends StatefulWidget {
  AvaliacaoProduto({Key? key}) : super(key: key);

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
      return "Péssimo";
    } else if (nota == 2) {
      return "Ruim";
    } else if (nota == 3) {
      return "Bom";
    } else if (nota == 4) {
      return "Ótimo";
    } else if (nota == 5) {
      return "Excelente";
    } else {
      return "Clique para avaliar";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Row(
            children: [
              IconButton(icon: starIcon(1), onPressed: () => setNota(1)),
              IconButton(icon: starIcon(2), onPressed: () => setNota(2)),
              IconButton(icon: starIcon(3), onPressed: () => setNota(3)),
              IconButton(icon: starIcon(4), onPressed: () => setNota(4)),
              IconButton(icon: starIcon(5), onPressed: () => setNota(5)),
            ],
          ),
          Text(
            mapNota(),
          ),
        ],
      ),
    );
  }
}
