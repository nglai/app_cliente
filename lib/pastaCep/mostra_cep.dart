// import 'package:app_cliente/pages/via_cep.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class MostraCep extends StatefulWidget {
//   @override
//   _MostraCepState createState() => _MostraCepState();
// }

// class _MostraCepState extends State<MostraCep> {
//   var _searchCepController = TextEditingController();
//   bool _loading = false;
//   bool _enableField = true;
//   late String _result;

//   @override
//   void dispose() {
//     super.dispose();
//     _searchCepController.clear();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Consultar CEP'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             _buildSearchCepTextField(),
//             _buildSearchCepButton(),
//             _buildResultForm()
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSearchCepTextField() {
//     return TextField(
//       autofocus: true,
//       keyboardType: TextInputType.number,
//       textInputAction: TextInputAction.done,
//       decoration: InputDecoration(labelText: 'Cep'),
//       controller: _searchCepController,
//       enabled: _enableField,
//     );
//   }

//   Widget _buildSearchCepButton() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20.0),
//       child: ElevatedButton(
//         onPressed: _searchCep,
//         child: _loading ? _circularLoading() : Text('Consultar'),
//       ),
//     );
//   }

//   void _searching(bool enable) {
//     setState(() {
//       _result = enable ? '' : _result;
//       _loading = enable;
//       _enableField = !enable;
//     });
//   }

//   Widget _circularLoading() {
//     return Container(
//       height: 15.0,
//       width: 15.0,
//       child: CircularProgressIndicator(),
//     );
//   }

//   Future _searchCep() async {
//     _searching(true);

//     final cep = _searchCepController.text;

//     final resultCep = await ViaCepService.fetchCep(cep: cep);
//     print(resultCep.localidade); // Exibindo somente a localidade no terminal

//     setState(() {
//       _result = resultCep.toJson();
//     });

//     _searching(false);
//   }

//   Widget _buildResultForm() {
//     return Container(
//       padding: EdgeInsets.only(top: 20.0),
//       child: Text(_result),
//     );
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(StringProperty('_result', _result));
//     properties.add(StringProperty('_result', _result));
//   }
// }
