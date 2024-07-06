import 'package:flutter/material.dart';
import 'screen/HomeView.dart';
import 'screen/tabs/ContactView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/contact': (context) => Contact(),
        '/home': (context) => const HomeView(),
      },
    );
  }
}
