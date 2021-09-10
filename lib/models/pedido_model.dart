class PedidoModel {
  final String? key;
  final String clienteKey;
  final String clienteNome;
  final List<dynamic> produto;


  PedidoModel({
    this.key,
    required this.clienteKey,
    required this.clienteNome,
    required this.produto,
  });

  static PedidoModel fromMap(Map<String, dynamic> map, [String? key]) =>
      PedidoModel(
        key: key,
        clienteKey: map['clienteKey'],
        clienteNome: map['clienteNome'],
        produto: map['produto'],
      );

  Map<String, dynamic> toMap() => {
        'clienteKey': clienteKey,
        'clienteNome': clienteNome,
        'produto': produto,
      };
}
