import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:street_fighter/features/personagem/personagem_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonagemView extends StatefulWidget {
  const PersonagemView({super.key});

  @override
  State<PersonagemView> createState() => _PersonagemViewState();
}

class _PersonagemViewState extends State<PersonagemView> {
  late SharedPreferences prefs;
  List<Map<String, dynamic>> personagens = [];

  @override
  void initState() {
    super.initState();
    start();
  }

  start() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('personagens') != null)
      personagens = prefs
          .getStringList('personagens')!
          .map((e) => jsonDecode(e) as Map<String, dynamic>)
          .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Street Fighter"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/personagem/inserir');
              },
              child: const Text(
                'Novo Personagem',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: personagens.length,
              itemBuilder: (_, index) => CardPersonagem(
                  personagem: Personagem.fromJson(personagens[index])),
            ),
          ),
        ],
      ),
    );
  }
}

class CardPersonagem extends StatelessWidget {
  final Personagem personagem;
  const CardPersonagem({required this.personagem, super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Color(0xFFEEAA33),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                child: Image.memory(base64Decode(personagem.imagem)),
                height: 300),
            H2(personagem.nome),
            Text(personagem.dataNascimento),
            Text(personagem.altura),
            Text(personagem.peso),
            Text(personagem.tipoSanguineo),
          ],
        ),
      ),
    );
  }
}

class H2 extends Text {
  final String titulo;
  const H2(this.titulo, {super.key})
      : super(titulo,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ));
}
