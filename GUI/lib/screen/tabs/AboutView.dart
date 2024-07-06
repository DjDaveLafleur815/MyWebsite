// Importation des packages
import 'package:flutter/material.dart';
class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // En-tête de la page
      appBar: AppBar(
        title: const Text('À Propos',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      // Contenu de la page
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'Passionné par l\'informatique le numérique et la programmation en général, j\'ai commencé par étudier les bases de HTML et CSS en 1ère STI2D option S.I.N.(Systèmes Informatiques et Numériques) puis me suis orienté vers une formation Développeur Web et Web Mobile (à temps partiel avec Web Force 3), ayant obtenu avec succès mon titre professionnel de niveau 5 (BAC+2) pour enchaîner sur une Formation Concepteur Développeur d\'Applications, puis finir sur une Formation Développeur en Intelligences Artificielles. Je suis également depuis 8 ans musicien en fanfare, batterie-fanfare, harmonie et dans plusieurs projets musicaux en tout genre (rock, métal, etc...)',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                Image.asset('assets/images/pic_of_me.jpg',
                  width: 300,
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
