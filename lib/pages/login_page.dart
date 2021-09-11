import 'package:app_cliente/controllers/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cadastro_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String senha = "";

  bool continuarConectado = false;

  late final userController =
      Provider.of<UserController>(context, listen: false);

  //get children => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Form(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 300,
                    //margin: EdgeInsets 0;
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (String? texto) {
                            if (texto != null && texto.isNotEmpty) {
                              if (!texto.contains('@') || texto.length < 8) {
                                return 'Digite um email válido';
                              }
                            } else {
                              return 'Campo obrigatório.';
                            }
                          },
                          onChanged: (texto) => email = texto,
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          autofocus: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail_outline,
                            ),
                            labelText: 'Email',
                            //border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          validator: (String? texto) {
                            if (texto != null && texto.isNotEmpty) {
                              if (texto.length < 8) {
                                return "Digite uma senha com 8 caracteres ou mais";
                              }
                            } else {
                              return "Campo obrigatório";
                            }
                          },
                          onChanged: (texto) => senha = texto,
                          obscureText: true,
                          autofocus: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key_sharp),
                            labelText: 'Senha',
                            //border:OutlineInputBorder(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('ta funcionando???');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                  color: Color(0xFF9d4edd), fontSize: 12),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: this.continuarConectado,
                              onChanged: (bool? novoValor) {
                                setState(() {
                                  this.continuarConectado = novoValor ?? true;
                                });
                              },
                            ),
                            Text(
                              'Continuar conectado?',
                              style: TextStyle(
                                color: Color(0xFF9d4edd),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Container(
                            // height: ,
                            width: 250,
                            child: ElevatedButton(
                              onPressed: () async {
                                var msg;
                                try {
                                  await userController.login(email, senha);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == "wrong-password") {
                                    msg = 'Senha inválida';
                                  } else if (e.code == "Invalid-email") {
                                    msg = 'Email inválido';
                                  } else if (e.code == "user-not-found") {
                                    msg = 'Usuário não localizado';
                                  } else {
                                    msg = "Ocorreu um erro: ${e.code}";
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(msg)),
                                  );
                                }
                              },
                              child: Text(
                                "Login",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Divider(),
                        ),
                        Text('Ainda não tem uma conta?',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 11)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 250,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CadastroPage(),
                                  ),
                                );
                              },
                              child: Text('Cadastre-se'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ); //elevatedButton: buttonPages(context),
  }
}
