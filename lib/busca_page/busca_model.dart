class BuscaPageModel {
  final String cep;
  final String logradouro;
  final String bairro;
  final String cidade;
  final String uf;
  final String ibge;

  BuscaPageModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.cidade,
    required this.uf,
    required this.ibge,
  });

  factory BuscaPageModel.fromJson(Map<String, dynamic> json) {
    return BuscaPageModel(
      cep: json['cep'] ?? '',
      logradouro: json[''] ?? '',
      bairro: json[''] ?? '',
      cidade: json[''] ?? '',
      uf: json[''] ?? '',
      ibge: json[''] ?? '',
    );
  }
}
