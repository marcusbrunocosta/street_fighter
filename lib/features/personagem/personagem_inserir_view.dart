import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:street_fighter/features/personagem/personagem_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonagemInserirView extends StatefulWidget {
  const PersonagemInserirView({super.key});

  @override
  State<PersonagemInserirView> createState() => _PersonagemInserirViewState();
}

class _PersonagemInserirViewState extends State<PersonagemInserirView> {
  late SharedPreferences prefs;
  String imagemPersonagem = '';
  List<Map<String, dynamic>> personagens = [];
  TextEditingController _nome = TextEditingController(text: '');
  TextEditingController _dataNascimento = TextEditingController(text: '');
  TextEditingController _altura = TextEditingController(text: '');
  TextEditingController _peso = TextEditingController(text: '');
  TextEditingController _tipoSanguineo = TextEditingController(text: '');

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
              onPressed: () async {
                Personagem personagem = Personagem(
                  imagem: imagemPersonagem,
                  nome: _nome.text,
                  dataNascimento: _dataNascimento.text,
                  altura: _altura.text,
                  peso: _peso.text,
                  tipoSanguineo: _tipoSanguineo.text,
                );
                personagens.add(personagem.toMap());
                prefs
                    .setStringList('personagens',
                        personagens.map((e) => jsonEncode(e)).toList())
                    .then((value) {
                  Navigator.of(context).pushReplacementNamed('/personagem');
                });
              },
              child: const Text(
                'Salvar',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Row(children: [
              ElevatedButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      imagemPersonagem =
                          base64Encode(await image.readAsBytes());
                      setState(() {});
                    }
                  },
                  child: const Text(
                    'Imagem do Personagem',
                  )),
            ]),
            Container(
                child: imagemPersonagem.isEmpty
                    ? Container()
                    : Image.memory(
                        base64Decode(imagemPersonagem),
                        height: 200,
                      )),
            SizedBox(height: 10),
            Row(children: [
              Text('Nome'),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextField(
                    controller: _nome,
                    decoration: InputDecoration(border: OutlineInputBorder())),
              )
            ]),
            const SizedBox(height: 10),
            Row(children: [
              const Text('Data Nascimento'),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextField(
                    controller: _dataNascimento,
                    decoration: InputDecoration(border: OutlineInputBorder())),
              )
            ]),
            SizedBox(height: 10),
            Row(children: [
              Text('Altura'),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextField(
                    controller: _altura,
                    decoration: InputDecoration(border: OutlineInputBorder())),
              )
            ]),
            SizedBox(height: 10),
            Row(children: [
              Text('Peso'),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextField(
                    controller: _peso,
                    decoration: InputDecoration(border: OutlineInputBorder())),
              )
            ]),
            SizedBox(height: 10),
            Row(children: [
              Text('Tipo Sanguineo'),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextField(
                    controller: _tipoSanguineo,
                    decoration: InputDecoration(border: OutlineInputBorder())),
              )
            ])
          ],
        ),
      ),
    );
  }
}
