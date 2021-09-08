import 'package:app_cliente/models/produto_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromocaoWidget extends StatefulWidget {
  PromocaoWidget({Key? key}) : super(key: key);

  @override
  _PromocaoWidgetState createState() => _PromocaoWidgetState();
}

class _PromocaoWidgetState extends State<PromocaoWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('produtos')
          .where('promocao', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final produtos = snapshot.data!.docs.map((map) {
          final data = map.data();
          return ProdutoModel.fromMap(data, map.id);
        }).toList();

        return CarouselSlider.builder(
          options: CarouselOptions(
            height: 350,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: Duration(seconds: 4),
          ),
          itemCount: produtos.length,
          itemBuilder: (context, index, pageView) {
            final produto = produtos[index];
            return InkWell(
              onTap: () {
                print('Clicou');
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Text('${produto.imagem!}'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 150,
                          child: Image.asset('imagem.png'),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        produto.nome,
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text('R\$ ${produto.preco.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.lineThrough)),
                      Text(
                        'R\$ ${(produto.preco - produto.precoDesconto).toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
