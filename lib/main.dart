// importations des Widgets de base de l'application
import 'package:flutter/material.dart';
import 'screen/HomeView.dart';
import 'screen/tabs/ContactView.dart';

// Fonction de lancement de l'application
void main() {
  runApp(const MyApp());
}

// Classe principale
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/contact': (context) => const Contact(),
        '/home': (context) => const HomeView(), // Définit la route vers la page d'accueil
      },
    );
  }
}
