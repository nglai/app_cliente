import 'package:app_cliente/models/produto_model.dart';
import 'package:app_cliente/pages/produto_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('produtos')
            .where('promocao', isEqualTo: 'Sim')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final produtos = snapshot.data!.docs.map((map) {
            final data = map.data();
            return ProdutoModel.fromMap(data, map.id);
          }).toList();

          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'PROMOÇÕES',
                    style: TextStyle(fontSize: 23),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 350,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        autoPlayInterval: Duration(seconds: 4),
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                      ),
                      itemCount: produtos.length,
                      itemBuilder: (context, index, pageView) {
                        final produto = produtos[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProdutoPage(
                                    produto,
                                    produto.avaliacao,
                                    produto.quantidadeAvaliacoes),
                              ),
                            );
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 150,
                                      child: produto.imagem != null
                                          ? Image.memory(
                                              produto.imagem!,
                                              width: 200,
                                              fit: BoxFit.contain,
                                            )
                                          : Container(
                                              child: Icon(Icons.no_photography),
                                              width: 72,
                                              height: double.maxFinite,
                                              color: Colors.blue,
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    produto.nome!,
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                      'R\$ ${produto.preco!.toStringAsFixed(2)}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          decoration:
                                              TextDecoration.lineThrough)),
                                  Text(
                                    'R\$ ${(produto.preco! - double.parse(produto.precoDesconto!)).toStringAsFixed(2)}',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AnimatedSmoothIndicator(
                        activeIndex: activeIndex,
                        count: produtos.length,
                        effect: JumpingDotEffect(
                            activeDotColor: Color(0xFF9D4EDD),
                            dotColor: Colors.black12)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'DESTAQUES',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final produto = produtos[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProdutoPage(
                                    produto,
                                    produto.avaliacao,
                                    produto.quantidadeAvaliacoes),
                              ),
                            );
                          },
                          child: Card(
                            child: produto.imagem != null
                                ? Image.memory(
                                    produto.imagem!,
                                    fit: BoxFit.contain,
                                  )
                                : Container(
                                    child: Icon(Icons.no_photography),
                                    width: 72,
                                    height: double.maxFinite,
                                    color: Colors.blue,
                                  ),
                          ),
                        );
                      }),
                ),
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: BouncingScrollPhysics(),
                //   itemCount: produtos.length,
                //   itemBuilder: (context, index) {
                //     final produto = produtos[index];
                //     return Padding(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 30, vertical: 20),
                //       child: Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: Colors.white,
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.grey.withOpacity(0.5),
                //               spreadRadius: 5,
                //               blurRadius: 7,
                //               offset:
                //                   Offset(0, 3), // changes position of shadow
                //             ),
                //           ],
                //         ),
                //         child: Column(
                //           children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.all(8.0),
                //                   child: Container(
                //                     child: produto.imagem != null
                //                         ? Row(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.center,
                //                             children: [
                //                               Container(
                //                                 width: 150,
                //                                 height: 150,
                //                                 child: Image.memory(
                //                                   produto.imagem!,
                //                                   width: 72,
                //                                   fit: BoxFit.contain,
                //                                 ),
                //                               ),
                //                             ],
                //                           )
                //                         : Container(
                //                             child: Icon(Icons.no_photography),
                //                             width: 72,
                //                             height: double.maxFinite,
                //                             color: Colors.blue,
                //                           ),
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.all(8.0),
                //                   child: Container(
                //                     child: Column(
                //                       children: [
                //                         Text('${produto.nome}',
                //                             style: TextStyle(fontSize: 22)),
                //                         Text('${produto.categoria}',
                //                             style: TextStyle(fontSize: 18)),
                //                         Text('R\$: ${produto.preco}',
                //                             style: TextStyle(fontSize: 20)),
                //                       ],
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
