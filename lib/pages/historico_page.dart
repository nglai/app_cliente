import 'dart:ui';
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
        backgroundColor: Color.fromRGBO(157, 78, 221, 1),
      ),
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
            return PedidoModel.fromMap(data, map.id);
          }).toList();

          return ListView.builder(
            itemCount: pedidos.length, // 3
            itemBuilder: (context, index) {
              print(index);
              final produto = pedidos[index];
              return Container(
                child: Column(
                  children: [
                    Container(
                      color: Color.fromRGBO(224, 170, 255, 1),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Pedido: ${produto.key}'),
                                  Text(
                                      'Data da compra: ${produto.produto[0]['dataCompra']}'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              color: Color.fromRGBO(224, 170, 255, 1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Status: Entregue',
                                    style: TextStyle(
                                      fontSize: 23,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: produto.produto.length, //3 //1 //2
                      itemBuilder: (context, index) {
                        print('Print 102: ${pedidos[index].produto.length}');
                        return Container(
                          child: Column(
                            children: [
                              Text(
                                '${produto.produto[index]['nome']}',
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
