import 'package:app_cliente/controllers/user_controller.dart';
import 'package:app_cliente/models/pedido_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoricoPage extends StatefulWidget {
  HistoricoPage({Key? key}) : super(key: key);

  @override
  _HistoricoPageState createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('pedidos')
            .where('clienteKey', isEqualTo: '1213')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final pedidos = snapshot.data!.docs.map((map) {
            final data = map.data();
            return PedidoModel.fromMap(data, map.id);
          }).toList();

          return ListView.builder(
            itemCount: pedidos.length,
            itemBuilder: (context, index) {
              final pedido = pedidos[index];
              for (var i = 0; i < pedido.pedido.length; i++) {
                print(pedido.pedido.length);
                return  Container(
                  child: Text('${pedido.pedido[i]['nome']}'),
                );
              }
             return Column(
              //  children: [
              //      for (var i = 0; i < pedidos[index]; i++) {
              //        return Container();
              //      },
              //  ],
             );
              
              
              // ListView.builder(
              //   itemCount: pedido.pedido.length,
              //   itemBuilder: (context, index) {
              //     return Container(
              //       child: Column(
              //         children: [
              //           Text('Pedido: $index'),
              //           Text('${pedido.pedido[index]['nome']}'),
              //         ],
              //       ),
              //     );
              //   },
              // );
            },
          );
        },
      ),
    );
  }
}
