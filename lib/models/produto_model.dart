import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoModel {
  final String? keyProduto;
  final String nome;
  final double preco;
  final String categoria;
  final String descricao;
  final String keyVendedor;
  final String vendedor;
  final bool promocao;
  final double precoDesconto;
  final int quantidade;
  final List<dynamic> avaliacao;
  final Uint8List? imagem;

  ProdutoModel({
    this.keyProduto,
    required this.nome,
    required this.preco,
    required this.categoria,
    required this.descricao,
    required this.keyVendedor,
    required this.vendedor,
    required this.promocao,
    required this.precoDesconto,
    required this.quantidade,
    required this.avaliacao,
    this.imagem,
  });

  static ProdutoModel fromMap(Map<String, dynamic> map, [String? keyProduto]) =>
      ProdutoModel(
        keyProduto: keyProduto,
        nome: map['nome'],
        preco: map['preco'],
        categoria: map['categoria'],
        descricao: map['descricao'],
        keyVendedor: map['keyVendedor'],
        vendedor: map['vendedor'],
        promocao: map['promocao'],
        precoDesconto: map['precoDesconto'],
        quantidade: map['quantidade'],
        avaliacao: map['avaliacao'],
        imagem: map['imagem']?.bytes,
      );

  Map<String, dynamic> toMap() => {
        'nome': nome,
        'preco': preco,
        'categoria': categoria,
        'descricao': descricao,
        'keyVendedor': keyVendedor,
        'vendedor': vendedor,
        'promocao': promocao,
        'precoDesconto': precoDesconto,
        'quantidade': quantidade,
        'avaliacao': avaliacao,
        'imagem': imagem != null ? Blob(imagem!) : null,
      };
}
