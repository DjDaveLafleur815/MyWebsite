// importations des Widgets de base de l'application
import 'package:flutter/material.dart';
import 'screen/HomeView.dart';

// Fonction de lancement de l'application
void main() {
  runApp(const MyApp());
}

// Classe principale
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
