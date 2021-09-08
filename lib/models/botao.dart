import 'package:app_cliente/pages/cadastro_page.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

ElevatedButton buttonPages(BuildContext context) {
  return new ElevatedButton(
    child: Text(
      'Criar conta',
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    ),
    onPressed: () {
      showBarModalBottomSheet(
          context: context, builder: (context) => CadastroPage());
    },
  );
}
