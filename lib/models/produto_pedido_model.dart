import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoPedidoModel {
  final String? keyProduto;
  final String nome;
  final double preco;
  final String keyVendedor;
  final String nomeVendedor;
  final String cor;
  final double precoTotal;
  final int quantidadeProduto;
  final Uint8List imagem;

  ProdutoPedidoModel({
    required this.precoTotal,
    required this.quantidadeProduto,
    this.keyProduto,
    required this.nome,
    required this.preco,
    required this.keyVendedor,
    required this.nomeVendedor,
    required this.cor,
    required this.imagem,
  });

  static ProdutoPedidoModel fromMap(Map<String, dynamic> map,
          [String? keyProduto]) =>
      ProdutoPedidoModel(
        keyProduto: keyProduto,
        nome: map['nome'],
        preco: map['preco'],
        keyVendedor: map['keyVendedor'],
        nomeVendedor: map['nomeVendedor'],
        cor: map['cor'],
        precoTotal: map['precoTotal'],
        quantidadeProduto: map['quantidadeProduto'],
        imagem: map['imagem']?.bytes,
      );

  Map<String, dynamic> toMap() => {
        'nome': nome,
        'preco': preco,
        'keyVendedor': keyVendedor,
        'nomeVendedor': nomeVendedor,
        'cor': cor,
        'precoTotal': precoTotal,
        'quantidadeProduto': quantidadeProduto,
        'imagem': Blob(imagem),
      };
}
