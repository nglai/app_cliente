class UsuarioModel {
  final String? key;
  final String nome;
  final String cpf;
  final String nascimento;
  final String endereco;
  final String cep;
  final String telefone;

  UsuarioModel({
    this.key,
    required this.nome,
    required this.cpf,
    required this.nascimento,
    required this.endereco,
    required this.cep,
    required this.telefone,
  });

  static UsuarioModel fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      key: map['key'],
      nome: map['nome'],
      cpf: map['cpf'],
      nascimento: map['nascimento'],
      endereco: map['endereco'],
      telefone: map['telefone'],
      cep: map['cep'],
    );
  }

  Map<String, dynamic> toMap() => {
        'key': key,
        'nome': nome,
        'cpf': cpf,
        'nascimento': nascimento,
        'endereco': endereco,
        'cep': cep,
      };
}
