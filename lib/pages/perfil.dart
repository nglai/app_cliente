import 'package:app_cliente/controllers/user_controller.dart';
import 'package:app_cliente/pages/historico_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'minha_conta.dart';

class Perfil extends StatefulWidget {
  Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late final userController =
      Provider.of<UserController>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
              color: Color.fromRGBO(224, 170, 255, 1),
            ),
            height: 200,
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                CircleAvatar(
                  child: FaIcon(FontAwesomeIcons.userNinja),
                  radius: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Olá, ${userController.model.nome}!",
                  style: textStyles.headline5,
                ),

              ],
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.userCircle),
            title: Text('Minha conta'),
            trailing: FaIcon(FontAwesomeIcons.angleRight),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MinhaConta()));
            },
          ),
          SizedBox(height: 20),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.clock),
            title: Text('Histórico'),
            trailing: FaIcon(FontAwesomeIcons.angleRight),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HistoricoPage()));
            },
          ),
          SizedBox(height: 20),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.signOutAlt),
            title: Text('Sair'),
            onTap: () async {
              await userController.logout();
            },
          )
        ],
      ),
    );
  }
}
