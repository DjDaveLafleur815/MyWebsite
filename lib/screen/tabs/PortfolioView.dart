// ignore: file_names
import 'package:flutter/material.dart';
class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Portfolio',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
          ),
        ),
      ),
      // Contenu de la page
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Vous trouverez ici toutes mes créations ainsi que mon CV',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Image.asset('assets/portfolio/ima_air_crash_disaster.jpg',
                  width: 300,
                  height: 300,
                ),
                Image.asset('assets/portfolio/img_le_blog_de_batman.jpg',
                  width: 300,
                  height: 300,
                ),
                Image.asset('assets/portfolio/img_nina_city.jpg',
                  width: 300,
                  height: 300,
                ),
                Image.asset('assets/portfolio/ANTOINE_David_CV2024.jpg',
                  width: 450,
                  height: 450,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
