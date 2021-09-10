import 'package:app_cliente/models/usuario_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_cliente/controllers/user_controller.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';

class EditarUsuarioWidget extends StatefulWidget {
  final UsuarioModel user;
  EditarUsuarioWidget({required this.user});

  @override
  _EditarUsuarioWidgetState createState() => _EditarUsuarioWidgetState();
}

class _EditarUsuarioWidgetState extends State<EditarUsuarioWidget> {
  late final userController =
  Provider.of<UserController>(context, listen: false);

  late final cepCont = TextEditingController()..text = widget.user.cep;
  late final enderecoCont = TextEditingController()
    ..text = widget.user.endereco;
  late final telefoneCont = TextEditingController()
    ..text = widget.user.telefone;
  late final nomeCont = TextEditingController()..text = widget.user.nome;
  late final nascimentoCont = TextEditingController()
    ..text = widget.user.nascimento;

  late Uint8List? file = widget.user.imagem;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar usuário"),
        backgroundColor: Color.fromRGBO(157, 78, 221, 1),
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 25),
                CircleAvatar(
                    radius: 50,
                    child: ClipRRect(
                      child: file != null
                          ? Image.memory(
                              file!,
                              fit: BoxFit.cover,
                              width: 100,
                            )
                          : FaIcon(FontAwesomeIcons.userNinja),
                      borderRadius: BorderRadius.circular(250),
                    )),
                IconButton(
                    alignment: Alignment.center,
                    onPressed: () async {
                      final result = await FilePicker.platform
                          .pickFiles(type: FileType.image);

                      if (result != null) {
                        setState(() {
                          final bytes = result.files.first.bytes;
                          file = bytes;
                        });
                      }

                    },
                    icon: FaIcon(
                      FontAwesomeIcons.cameraRetro,
                      size: 20,
                    )),
                Text("Nome:"),
                TextField(
                    style: textStyles.headline6,
                    controller: nomeCont,
                    decoration: InputDecoration(
                      suffixIcon: FaIcon(
                        FontAwesomeIcons.penAlt,
                        color: Colors.grey,
                        size: 17,
                      ),
                    )),
                Text("Nascimento:"),
                TextField(
                    style: textStyles.headline6,
                    controller: nascimentoCont,
                    decoration: InputDecoration(
                      suffixIcon: FaIcon(
                        FontAwesomeIcons.penAlt,
                        color: Colors.grey,
                        size: 17,
                      ),
                    )),
                Text("CEP:"),
                TextField(
                    style: textStyles.headline6,
                    controller: cepCont,
                    decoration: InputDecoration(
                      suffixIcon: FaIcon(
                        FontAwesomeIcons.penAlt,
                        color: Colors.grey,
                        size: 17,
                      ),
                    )),
                Text("Endereço:"),
                TextField(
                    style: textStyles.headline6,
                    controller: enderecoCont,
                    decoration: InputDecoration(
                      suffixIcon: FaIcon(
                        FontAwesomeIcons.penAlt,
                        color: Colors.grey,
                        size: 17,
                      ),
                    )),
                Text("Telefone:"),
                TextField(
                    style: textStyles.headline6,
                    controller: telefoneCont,
                    decoration: InputDecoration(
                      suffixIcon: FaIcon(
                        FontAwesomeIcons.penAlt,
                        color: Colors.grey,
                        size: 17,
                      ),
                    )),
                SizedBox(height: 20,),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color.fromRGBO(157, 78, 221, 1)),
                    onPressed: () async {
                      final userUpdate = UsuarioModel(
                              key: userController.user!.uid,
                              nome: nomeCont.text,
                              cpf: widget.user.cpf,
                              nascimento: nascimentoCont.text,
                              cep: cepCont.text,
                              endereco: enderecoCont.text,
                              telefone: telefoneCont.text,
                              imagem: file)
                          .toMap();


                      await FirebaseFirestore.instance
                          .collection('usuarios')
                          .doc(userController.user!.uid)
                          .update(userUpdate);

                             

                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Atualizar dados"),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
