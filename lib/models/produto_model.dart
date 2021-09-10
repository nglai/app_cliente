import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoModel {
  final String? keyProduto;
  final String? nome;
  final double? preco;
  final String? categoria;
  final String? descricao;
  final String? keyVendedor;
  final String? nomeVendedor;
  final String? cor;
  final String? promocao;
  final String? precoDesconto;
  final int? quantidade;
  final int? avaliacao;
  final int? quantidadeAvaliacoes;
  final Uint8List? imagem;

  ProdutoModel(
      {this.keyProduto,
      this.nome,
      this.preco,
      this.categoria,
      this.descricao,
      this.keyVendedor,
      this.nomeVendedor,
      this.cor,
      this.promocao,
      this.precoDesconto,
      this.quantidade,
      this.avaliacao,
      this.imagem,
      this.quantidadeAvaliacoes});

  static ProdutoModel fromMap(Map<String, dynamic> map, [String? keyProduto]) =>
      ProdutoModel(
        keyProduto: keyProduto,
        nome: map['nome'],
        preco: map['preco'],
        categoria: map['categoria'],
        descricao: map['descricao'],
        keyVendedor: map['keyVendedor'],
        nomeVendedor: map['nomeVendedor'],
        cor: map['cor'],
        promocao: map['promocao'],
        precoDesconto: map['precoDesconto'],
        quantidade: map['quantidade'],
        avaliacao: map['avaliacao'],
        quantidadeAvaliacoes: map['quantidadeAvaliacoes'],
        imagem: map['imagem']?.bytes,
      );

  Map<String, dynamic> toMap() => {
        'nome': nome,
        'preco': preco,
        'categoria': categoria,
        'descricao': descricao,
        'keyVendedor': keyVendedor,
        'nomeVendedor': nomeVendedor,
        'cor': cor,
        'promocao': promocao,
        'precoDesconto': precoDesconto,
        'quantidade': quantidade,
        'avaliacao': avaliacao,
        'quantidadeAvaliacoes': quantidadeAvaliacoes,
        'imagem': imagem != null ? Blob(imagem!) : null,
      };
}
