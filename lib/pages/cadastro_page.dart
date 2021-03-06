import 'package:app_cliente/controllers/user_controller.dart';
import 'package:app_cliente/models/usuario_model.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroPage extends StatefulWidget {
  // CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController txtcep = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _cpf = TextEditingController();
  var maskNumber = new MaskTextInputFormatter(
      mask: '(##)#.####-####)', filter: {"#": RegExp(r'[0-9]')});
  var maskData = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  String nome = "";
  String cpf = "";
  String nascimento = "";
  String telefone = "";
  String email = "";
  String cep = "";
  String endereco = "";
  String senha = "";

  late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );

  @override
  Widget build(BuildContext context) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (String? texto) {
                        if (texto != null && texto.isNotEmpty) {
                          if (texto.length == 0) {
                            return 'Informe o Nome';
                          } else if (!regExp.hasMatch(texto)) {
                            return 'O Nome deve conter caracteres de a-z ou A-Z';
                          }
                        } else {
                          return 'Campo obrigat??rio';
                        }
                      },
                      onChanged: (texto) => nome = texto,
                      keyboardType: TextInputType.name,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Nome completo ',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    TextFormField(
                      validator: (String? texto) {
                        String cpf = _cpf.text;
                        if (GetUtils.isCpf(cpf)) {
                        } else {
                          return 'cpf invalido';
                        }
                      },
                      controller: _cpf,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter()
                      ],
                      onChanged: (texto) => cpf = texto,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'CPF',
                        prefixIcon: Icon(Icons.document_scanner_outlined),
                      ),
                    ),
                    TextFormField(
                      inputFormatters: [maskData],
                      onChanged: (texto) => nascimento = texto,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Data de nascimento',
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                    TextFormField(
                      validator: (String? texto) {
                        if (texto != null && texto.isNotEmpty) {
                          if (!texto.contains('@') || texto.length < 8) {
                            return 'Digite um email v??lido';
                          }
                        } else {
                          return 'Campo obrigat??rio.';
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
                      validator: (String? param) {
                        if (param != null && param.isNotEmpty) {
                          if (param.length < 15) {
                            return 'Telefone inv??lido.';
                          }
                        } else {
                          return 'Informe seu telefone.';
                        }
                      },
                      inputFormatters: [maskNumber],
                      onChanged: (texto) => telefone = texto,
                      keyboardType: TextInputType.phone,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Telefone',
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    TextFormField(
                      controller: txtcep,
                      onChanged: (texto) => cep = texto,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Cep',
                        prefixIcon: Icon(Icons.location_city),
                      ),
                    ),
                    TextFormField(
                      onChanged: (texto) => endereco = texto,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Endere??o',
                        prefixIcon: Icon(Icons.location_on),
                      ),
                    ),
                    TextFormField(
                        validator: (String? texto) {
                          if (texto != null && texto.isNotEmpty) {
                            if (texto.length < 6) {
                              return "Digite uma senha com 6 caracteres ou mais";
                            }
                          } else {
                            return "Campo obrigat??rio";
                          }
                        },
                        onChanged: (texto) => senha = texto,
                        obscureText: true,
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key_sharp),
                          labelText: 'Senha',
                          //border:OutlineInputBorder(),
                        )),
                    TextFormField(
                        validator: (String? texto) {
                          if (texto != null && texto.isNotEmpty) {
                            if (texto.length < 6) {
                              return "Digite uma senha com 6 caracteres ou mais";
                            }
                          } else {
                            return "Campo obrigat??rio";
                          }
                        },
                        onChanged: (texto) => senha = texto,
                        obscureText: true,
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key_sharp),
                          labelText: 'Confirma????o de senha',
                          //border:OutlineInputBorder(),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            print('Login feito');
                            final user = UsuarioModel(
                              nome: nome,
                              endereco: endereco,
                              cpf: cpf,
                              nascimento: nascimento,
                              cep: cep,
                              telefone: telefone,
                            );
                            await userController.signup(email, senha, user);
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Criar conta"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
