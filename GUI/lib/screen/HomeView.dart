// Importation des packages
import 'package:flutter/material.dart';
import 'package:my_website/globals/mysiteList.dart';
import 'tabs/AboutView.dart';
import 'tabs/ContactView.dart';
import 'tabs/HomeView.dart';
import 'tabs/PortfolioView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  // Liste des vues
  List<Widget> views = const [
    Home(),
    AboutMe(),
    Portfolio(),
    Contact(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Contenu de la page
      body: views[currentIndex],
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
