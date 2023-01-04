class Personagem {
  final String nome;
  String imagem;
  String dataNascimento;
  String altura;
  String peso;
  String tipoSanguineo;
  int poderDeFogo;
  int pontosDeVida;
  int pontosDeMagia;
  int experiencia;

  Personagem({
    required this.nome,
    this.imagem = "",
    this.dataNascimento = "",
    this.altura = "",
    this.peso = "",
    this.tipoSanguineo = "",
    this.poderDeFogo = 0,
    this.pontosDeVida = 0,
    this.pontosDeMagia = 0,
    this.experiencia = 0,
  });

  factory Personagem.fromJson(Map<String, dynamic> json) {
    return Personagem(
      nome: json['nome'] ?? '',
      imagem: json['imagem'] ?? "assets/imagens/default.webp",
      dataNascimento: json['data_nascimento'] ?? "",
      altura: json['altura'] ?? "",
      peso: json['peso'] ?? "",
      tipoSanguineo: json['tipo_sanguineo'] ?? "",
      poderDeFogo: json['poderDeFogo']?.toInt() ?? 0,
      pontosDeVida: json['pontosDeVida']?.toInt() ?? 0,
      pontosDeMagia: json['pontosDeMagia']?.toInt() ?? 0,
      experiencia: json['experiencia']?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> json = {};
    json['imagem'] = imagem;
    json['nome'] = nome;
    json['data_nascimento'] = dataNascimento;
    json['altura'] = altura;
    json['peso'] = peso;
    json['tipo_sanguineo'] = tipoSanguineo;
    return json;
  }
}
