import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:app_cliente/controllers/user_controller.dart';
import '../models/usuario_model.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import 'editar_usuario.dart';

class MinhaConta extends StatefulWidget {
  @override
  _MinhaContaState createState() => _MinhaContaState();
}

class _MinhaContaState extends State<MinhaConta> {
  late final userController =
      Provider.of<UserController>(context, listen: false);

  Uint8List? file;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: Text("Minha conta"),
          backgroundColor: Color.fromRGBO(157, 78, 221, 1),
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('usuarios')
                .where('key', isEqualTo: userController.user!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              print(snapshot);

              final usuarios = snapshot.data!.docs.map((map) {
                final data = map.data();
                return UsuarioModel.fromMap(data, map.id);
              }).toList();

              return ListView.builder(
                itemCount: usuarios.length,
                itemBuilder: (context, index) {
                  final usuario = usuarios[index];
                  print(usuario);                  
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 25),
                        CircleAvatar(
                            radius: 50,
                            child: ClipRRect(
                              child: usuario.imagem != null
                                  ? Image.memory(
                                      usuario.imagem!,
                                      fit: BoxFit.cover,
                                      width: 100,
                                    )
                                  : FaIcon(FontAwesomeIcons.userNinja),
                              borderRadius: BorderRadius.circular(250),
                            )),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${usuario.nome}",
                                style: textStyles.headline4,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 25),
                              Text("E-mail:"),
                              Text("${userController.user!.email}",
                                  style: textStyles.headline5),
                              SizedBox(height: 25),
                              Text("CPF"),
                              Text("${userController.model.cpf}",
                                  style: textStyles.headline5),
                              SizedBox(height: 25),
                              Text("Nascimento"),
                              Text("${usuario.nascimento}",
                                  style: textStyles.headline5),
                              SizedBox(height: 25),
                              Text("CEP"),
                              Text("${usuario.cep}",
                                  style: textStyles.headline5),
                              SizedBox(height: 25),
                              Text("Endereço"),
                              Text("${usuario.endereco}",
                                  style: textStyles.headline5),
                              SizedBox(height: 25),
                              Text("Telefone"),
                              Text("${usuario.telefone}",
                                  style: textStyles.headline5),
                              SizedBox(height: 20),
      
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(primary: Color.fromRGBO(157, 78, 221, 1)),
                                  onPressed: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditarUsuarioWidget(
                                                  user: usuario,
                                                )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text("Atualizar dados"),
                                  ),
                                ),
                              ),
                              SizedBox(height: 25),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }));
  }
}
