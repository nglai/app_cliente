class PedidoModel {
  final String? key;
  final String clienteKey;
  final String clienteNome;
  final List<dynamic> pedido;

  PedidoModel({
    this.key,
    required this.clienteKey,
    required this.clienteNome,
    required this.pedido,
  });

  static PedidoModel fromMap(Map<String, dynamic> map, [String? key]) =>
      PedidoModel(
        key: key,
        clienteKey: map['clienteKey'],
        clienteNome: map['clienteNome'],
        pedido: map['pedido'],
      );

  Map<String, dynamic> toMap() => {
        'clienteKey': clienteKey,
        'clienteNome': clienteNome,
        'pedido': pedido,
      };
}
