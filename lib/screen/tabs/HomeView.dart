import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ANTOINE David',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20), // Espace de 20 pixels en haut
              child: const Text(
            'Développeur Web et Web Mobile, Bloggeur, Programmeur et Futur Concepteur Développeur d\'Applications...',
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.justify,
            ),
            ),
          ],
        ),
      ),
    );
  }
}