import 'package:app_cliente/controllers/user_controller.dart';
import 'package:app_cliente/models/botao.dart';
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

  late final userController =
      Provider.of<UserController>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await userController.login(email, senha);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == "wrong-password") {
                      } else if (e.code == "Invalid-email") {
                      } else {}
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Ocorre um erro: ${e.code}")),
                      );
                    }
                  },
                  child: Text("Login"),
                ),
              ),
              Text("OU"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CadastroPage(),
                      ),
                    );
                  },
                  child: Text("Criar conta"),
                ),
              )
            ],
          ),
        ),
      ),
      //elevatedButton: buttonPages(context),
    );
  }
}
