import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:app_cliente/controllers/user_controller.dart';
import '../models/usuario_model.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';

class MinhaConta extends StatefulWidget {
  MinhaConta({Key? key}) : super(key: key);

  @override
  _MinhaContaState createState() => _MinhaContaState();
}

class _MinhaContaState extends State<MinhaConta> {
    final UserModel model;
    late final userController =
      Provider.of<UserController>(context, listen: false);

    Uint8List? file;

    String cep = "", cpf = "", endereco = "", key="", nascimento="",nome="",telefone="";
    
    late final cepCont = TextEditingController()..text = userController.model.cep,
    late final enderecoCont = TextEditingController()..text = userController.model.endereco,
    late final telefoneCont = TextEditingController()..text = userController.model.telefone, 
    late final emailCont =  ,
    
    
      
    
  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return 
      Scaffold(
        appBar: AppBar(
          title: Text("Minha conta"),
          backgroundColor: Color.fromRGBO(157, 78, 221, 1),
        ),
        body:
        SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 25),
             CircleAvatar( 
                  radius: 50,
                  child: ClipRRect(
                    child: 
                    file != null ?
                       Image.memory(file!, fit: BoxFit.cover, width: 100,) 
                       : FaIcon(FontAwesomeIcons.userNinja),

                  borderRadius: BorderRadius.circular(250),
                  )
            ),
            IconButton(
                            alignment: Alignment.center,
                            onPressed: () async {
                              final result =
                              await FilePicker.platform.pickFiles(type: FileType.image);
                    
                              if (result != null) {
                                setState(() {
                                  final bytes = result.files.first.bytes;
                                  file = bytes;
                                });
                              }
                    
                              final userUpdate = UsuarioModel(key:userController.model.key, nome: userController.model.nome, cpf: userController.model.cpf, nascimento: userController.model.nascimento,
                              endereco: userController.model.endereco, cep: userController.model.cep, telefone: userController.model.telefone, imagem: file).toMap();
                    
                              await FirebaseFirestore.instance
                              .collection('usuarios')
                              .doc(userController.user!.uid)
                              .update(userUpdate);
                    
                            },
                            icon: FaIcon(FontAwesomeIcons.cameraRetro, size: 20,)
            ),
             Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("${userController.model.nome}",style: textStyles.headline4, textAlign: TextAlign.center,),
                SizedBox(height: 25),
                Text("CPF"),
                Text("${userController.model.cpf}",style: textStyles.headline5),
                SizedBox(height: 20),
                Text("Nascimento"),
                Text("${userController.model.nascimento}",style: textStyles.headline5),
                SizedBox(height: 20),
                Text("CEP"),
                Text("${userController.model.cep}",style: textStyles.headline5),
                SizedBox(height: 20),
                Text("Endereço"),
                Text("${userController.model.endereco}",style: textStyles.headline5),
                SizedBox(height: 20),
                Text("Telefone"),
                Text("${userController.model.telefone}",style: textStyles.headline5),
                SizedBox(height: 20),
                Text("E-mail:"),
                Text("${userController.user!.email!}",style: textStyles.headline5),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                    final user = await FirebaseFirestore.instance
                        .collection('usuarios')
                        .doc(userController.user!.uid)
                        .get();

                    // final data = user.data()!;

                    final atualizarUser = UsuarioModel(
                      key: userController.user!.uid,
                      cep: cep,
                      cpf: cpf,
                      endereco: endereco,
                      nascimento: nascimento,
                      nome: nome,
                      imagem: file,
                      telefone: telefone,
                    ).toMap();

                    await FirebaseFirestore.instance
                        .collection('usuarios')
                        .add(atualizarUser);
                    
                    Navigator.pop(context);
                    
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
        ),
      );
  }
}


      
