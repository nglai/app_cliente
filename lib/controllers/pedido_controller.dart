import 'package:flutter/cupertino.dart';

final pedidoController = PedidoController();

class PedidoController extends ChangeNotifier {
  List<Map<String, dynamic>> pedido = [];

  void addProduto(Map<String, dynamic> produto) {
    pedido.add(produto);
    notifyListeners();
  }

  void removeProduto(Map<String, dynamic> produto) {
    pedido.remove(produto);
    notifyListeners();
  }

  void clearList() {
    pedido.clear();
    notifyListeners();
  }
}
