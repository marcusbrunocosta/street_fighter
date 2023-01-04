import 'package:flutter_test/flutter_test.dart';
import 'package:street_fighter/features/personagem/personagem_model.dart';
import 'package:street_fighter/shared/constantes/personagens.dart';

Map<String, dynamic> jsonPersonagem = {};
void main() {
  setUp(() {
    jsonPersonagem = {
      "nome": "Blanka",
      "data_nascimento": "12/02/1966",
      "altura": "1,92 cm",
    };
  });
  test('Personagem | Model', () {
    Personagem personagem = Personagem.fromJson(jsonPersonagem);
    expect(personagem.nome, "Blanka");
  });
}
