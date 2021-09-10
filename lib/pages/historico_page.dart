import 'package:app_cliente/controllers/user_controller.dart';
import 'package:app_cliente/models/pedido_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';

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
  final List<Map<String, dynamic>> _items = [
    {
      'value': '0',
      'label': '0',
      'icon': Icon(Icons.stop),
    },
    {
      'value': '1',
      'label': '1',
      'icon': Icon(Icons.stop),
    },
    {
      'value': '2',
      'label': '2',
      'icon': Icon(Icons.stop),
    },
    {
      'value': '3',
      'label': '3',
      'icon': Icon(Icons.stop),
    },
    {
      'value': '4',
      'label': '4',
      'icon': Icon(Icons.stop),
    },
    {
      'value': '5',
      'label': '5',
      'icon': Icon(Icons.stop),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Histórico'),
          backgroundColor: Color.fromRGBO(157, 78, 221, 1)),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('pedidos')
            .where('clienteKey', isEqualTo: userController.user!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final pedidos = snapshot.data!.docs.map((map) {
            final data = map.data();
            print(data);
            return PedidoModel.fromMap(data, map.id);
          }).toList();

          return ListView.builder(
            itemCount: pedidos.length,
            itemBuilder: (context, index) {
              final pedido = pedidos[index];
              return Container(
                color: Colors.white,
                child: Text(
                  '${pedido.pedido[index]['nome']}',
                ),

                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: BouncingScrollPhysics(),
                //   itemCount: 1,
                //   itemBuilder: (context, index) {
                //     return Column(
                //       crossAxisAlignment: CrossAxisAlignment.stretch,
                //       children: [
                //         Container(
                //             child: Column(
                //           children: [
                //             Text('${pedido.keyProduto}'),
                //             Text('${pedido.imagem}'),
                //             Text('${pedido.nome}'),
                //             Text('${pedido.preco}'),
                //             Text('${pedido.quantidadeProduto}'),
                //             Text('${pedido.precoTotal}'),
                //           ],
                //         ))
                //       ],
                //     );
                //   },
                // ),
              );
            },
          );
        },
      ),
    );
  }
}
