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
            return PedidoModel.fromMap(data, map.id);
          }).toList();

          return ListView.builder(
            itemCount: pedidos.length,
            itemBuilder: (context, index) {
              final pedido = pedidos[index];
              return Container(
                color: Colors.white,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: pedido.pedido.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            color: Color.fromRGBO(224, 170, 255, 1),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            'Pedido: ${pedido.key}',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            'Data da compra: 03/09/2021',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Status: Entregue',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    pedido.pedido[index]['imagem'] != null
                                        ? Container(
                                            width: 300,
                                            height: 300,
                                            child: Image.memory(
                                              pedido.pedido[index]['imagem']!,
                                              width: 72,
                                              fit: BoxFit.contain,
                                            ),
                                          )
                                        : Container(
                                            child: Icon(Icons.no_photography),
                                            width: 72,
                                            height: double.maxFinite,
                                            color: Colors.blue,
                                          ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Produto: ${pedido.pedido[index]['nome']}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      'Quantidade: ${pedido.pedido[index]['quantidade']}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      'Preco por unidade: R\$ ${pedido.pedido[index]['preco']}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      'Preco do pedido: R\$ ${pedido.pedido[index]['precoTotal']}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      'Vendido e entregue por ${pedido.pedido[index]['nomeVendedor']}',
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 20, 20),
                                child: ElevatedButton(
                                  onPressed: () {
                                    int nota;
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Selecione uma nota'),
                                          content: SingleChildScrollView(
                                            child: SelectFormField(
                                              type: SelectFormFieldType
                                                  .dropdown, // or can be dialog
                                              initialValue: '5',
                                              labelText: 'Nota',
                                              items: _items,
                                              onChanged: (val) =>
                                                  nota = int.parse(val),
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () async {
                                                  // final avaliacao = ProdutoModel(

                                                  // avaliacao: nota)
                                                  // await FirebaseFirestore.instance.collection('produtos').doc(pedido.pedido[index]['keyProduto']).update();
                                                },
                                                child:
                                                    Text('Confirmar avaliação'))
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text('Avaliar produto'),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                    Color.fromRGBO(157, 78, 221, 1),
                                  )),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    }),
              );
            },
          );
        },
      ),
    );
  }
}
