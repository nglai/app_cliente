import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 30,
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Color.fromRGBO(157, 78, 221, 1),
                  padding: EdgeInsets.all(15),
                  child: Container(
                    child: Text(
                      'Categorias',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12),
              ),
            ),
            child: ListTile(
              title: Text(
                'Todos os produtos',
                style: TextStyle(
                  color: Color.fromRGBO(157, 78, 221, 1),
                  fontSize: 16,
                ),
              ),
              leading: FaIcon(FontAwesomeIcons.listAlt),
              onTap: () {},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12),
              ),
            ),
            child: ListTile(
              title: Text(
                'Celulares',
                style: TextStyle(
                  color: Color.fromRGBO(157, 78, 221, 1),
                  fontSize: 16,
                ),
              ),
              leading: FaIcon(FontAwesomeIcons.mobileAlt),
              onTap: () {},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12),
              ),
            ),
            child: ListTile(
              title: Text(
                'Notebooks',
                style: TextStyle(
                  color: Color.fromRGBO(157, 78, 221, 1),
                  fontSize: 16,
                ),
              ),
              leading: FaIcon(FontAwesomeIcons.laptopCode),
              onTap: () {},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12),
              ),
            ),
            child: ListTile(
              title: Text(
                'Televisões',
                style: TextStyle(
                  color: Color.fromRGBO(157, 78, 221, 1),
                  fontSize: 16,
                ),
              ),
              leading: FaIcon(FontAwesomeIcons.tv),
              onTap: () {},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12),
              ),
            ),
            child: ListTile(
              title: Text(
                'Video Games',
                style: TextStyle(
                  color: Color.fromRGBO(157, 78, 221, 1),
                  fontSize: 16,
                ),
              ),
              leading: FaIcon(FontAwesomeIcons.gamepad),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
