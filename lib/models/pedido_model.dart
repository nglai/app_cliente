class PedidoModel {
  final String? key;
  final String clienteKey;
  final List<Map<String, dynamic>> pedido;

  PedidoModel({
    this.key,
    required this.clienteKey,
    required this.pedido,
  });

  static PedidoModel fromMap(Map<String, dynamic> map, [String? key]) =>
      PedidoModel(
          key: key, clienteKey: map['clienteKey'], pedido: map['pedido']);

  Map<String, dynamic> toMap() => {
        'clienteKey': clienteKey,
        'pedido': pedido,
      };
}
