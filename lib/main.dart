import 'package:flutter/material.dart';
import 'package:street_fighter/features/personagem/personagem_inserir_view.dart';
import 'package:street_fighter/features/personagem/personagem_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Street Fighter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.blue,
        backgroundColor: Colors.blueGrey,
      ),
      initialRoute: '/personagem',
      routes: {
        '/personagem': (_) => const PersonagemView(),
        '/personagem/inserir': (_) => const PersonagemInserirView(),
      },
    );
  }
}
