import 'package:flutter/cupertino.dart';

final pedidoController = PedidoController();

class PedidoController extends ChangeNotifier {
  List<Map<String, dynamic>> pedido = [];
}
