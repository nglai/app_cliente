import 'package:app_cliente/controllers/user_controller.dart';
import 'package:app_cliente/models/produto_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Listadestaques extends StatefulWidget {
  @override
  _Listadestaques createState() => _Listadestaques();
}

class _Listadestaques extends State<Listadestaques> {
  late final userController =
      Provider.of<UserController>(context, listen: false);

  get itemBuilder => null;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('produtos').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final produtos = (snapshot.data!.docs.map(
          (map) {
            final data = map.data();
            return ProdutoModel.fromMap(data, map.id);
          },
        ).toList());
        print(produtos);
        return ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: produtos.length,
          itemBuilder: (context, index) {
            final produto = produtos[index];
            return Column(
              children: [
                produto.imagem != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: Image.memory(
                              produto.imagem!,
                              width: 72,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      )
                    : Container(
                        child: Icon(Icons.no_photography),
                        width: 72,
                        height: double.maxFinite,
                        color: Colors.blue,
                      ),
              ],
            );
            // Text(produto.nome);
          },
        );
      },
    );
  }
}
