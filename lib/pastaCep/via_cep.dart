// import 'package:app_cliente/models/cep.dart';
// import 'package:http/http.dart' as http;

// class ViaCepService {
//   static Future<ResultadoCep> fetchCep({cep}) async {
//     final response =
//         await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
//     if (response.statusCode == 200) {
//       return ResultadoCep.fromJson(response.body);
//     } else {
//       throw Exception('Requisição inválida!');
//     }
//   }
// }
