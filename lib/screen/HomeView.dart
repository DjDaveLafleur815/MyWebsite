// Importation des packages
import 'package:flutter/material.dart';
import 'package:my_website/globals/mysiteList.dart';
import 'package:my_website/screen/tabs/ContactView.dart';
import 'package:my_website/screen/tabs/PortfolioView.dart';
import 'tabs/AboutView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0; // Déplacer currentIndex ici pour qu'il soit un membre de la classe d'état

  // Méthode pour obtenir la vue en fonction de l'index sélectionné
  Widget _getSelectedView() {
    switch (currentIndex) {
      case 0:
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'ANTOINE David, Développeur Web et Web Mobile, Bloggeur, Programmeur et Futur Concepteur Développeur d\'Applications...',
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        );
      case 1:
        return const AboutMe();
      case 2:
        return const Portfolio();
      case 3:
        return const Contact();
      default:
        return const Center(child: Text('Unknown View', style: TextStyle(fontSize: 25)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Contenu de la page
      body: Center(
        child: _getSelectedView(),
      ),
      // Widget de navigation
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: mysite,
      ),
    );
  }
}
