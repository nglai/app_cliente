// import 'dart:convert';

// class ResultadoCep {
//   late String cep;
//   late String logradouro;
//   late String bairro;
//   late String localidade;
//   late String uf;

//   ResultadoCep({
//     required this.cep,
//     required this.logradouro,
//     required this.bairro,
//     required this.localidade,
//     required this.uf,
//   });

//   factory ResultadoCep.fromJson(String str) =>
//       ResultadoCep.fromMap(json.decode(str));
//   String toJson() => json.encode(toMap());

//   factory ResultadoCep.fromMap(Map<String, dynamic> json) => ResultadoCep(
//         cep: json["cep"],
//         logradouro: json["logradouro"],
//         bairro: json["bairro"],
//         localidade: json["localidade"],
//         uf: json["uf"],
//       );

//   Map<String, dynamic> toMap() => {
//         "cep": cep,
//         "logradouro": logradouro,
//         "bairro": bairro,
//         "localidade": localidade,
//         "uf": uf,
//       };
// }
