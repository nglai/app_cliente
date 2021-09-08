import 'package:app_cliente/pages/home_page.dart';
import 'package:app_cliente/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'perfil.dart';
import 'carrinho.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;

  final telas = [
    //EDITAR COM NOMES DAS PÁGINAS
    HomePage(),
    Perfil(),
    Carrinho(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(157, 78, 221, 1),
      ),
      drawer: DrawerWidget(),
      body: telas[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userCircle),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.shoppingCart),
            label: 'Carrinho',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(157, 78, 221, 1),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        // backgroundColor: Colors.white,
      ),
    );
  }
}
