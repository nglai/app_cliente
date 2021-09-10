import 'package:app_cliente/controllers/user_controller.dart';
import 'package:app_cliente/models/usuario_model.dart';
import 'package:app_cliente/pages/historico_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('usuarios')
                .doc(userController.user!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              final usuarios = UsuarioModel.fromMap(snapshot.data!.data()!);

              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  color: Color.fromRGBO(224, 170, 255, 1),
                ),
                height: 300,
                alignment: Alignment.center,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    // CircleAvatar(
                    //   child: usuarios.imagem != null ? Image.memory(usuarios.imagem!, fit: BoxFit.cover,) : Container(child: Icon(FontAwesomeIcons.userNinja)),
                    //   radius: 50,
                    // ),

                    CircleAvatar(
                        radius: 50,
                        child: ClipRRect(
                          child: usuarios.imagem != null
                              ? Image.memory(
                                  usuarios.imagem!,
                                  fit: BoxFit.cover,
                                  width: 100,
                                )
                              : FaIcon(FontAwesomeIcons.userNinja),
                          borderRadius: BorderRadius.circular(250),
                        )),

                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Olá!",
                      style: textStyles.headline5, textAlign: TextAlign.center,
                    ),
                    Text(
                      usuarios.nome,
                      style: textStyles.headline5, textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
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
