// importations des Widgets de base de l'application
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

// Classe de la page 'Contact'
class _ContactState extends State<Contact> {
  int currentIndex = 3;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final firstNameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

@override
  void dispose() {
    // Libérer les contrôleurs lorsqu'ils ne sont plus nécessaires
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

// Fonction de soumission du formulaire
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Afficher un SnackBar avec un message de succès
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message envoyé avec succès !')),
      );

      // Naviguer vers la page d'accueil après un délai pour permettre la visualisation du SnackBar
      Future.delayed(const Duration(seconds: 0), () {
        Navigator.of(context).pushNamed('/home',
            arguments: 'Message envoyé avec succès !',
        );
      });

      // Réinitialiser les contrôleurs pour effacer le formulaire
      nameController.clear();
      emailController.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
// En-tête de la page
      appBar: AppBar(
        title: const Text('Contactez-moi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
// Contenu de la page
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
// Champ 'Nom'
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Nom :',
            hintText: 'Entrez votre nom',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez entrer votre nom !';
            }
            return null;
          },
        ),
// Champ 'Prénom'
      TextFormField(
        controller: firstNameController,
        decoration: const InputDecoration(
          labelText: 'Prénom :',
          hintText: 'Entrez votre prénom',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez entrer votre prénom !';
          }
          return null;
        },
      ),
// Champ 'E-mail'
      TextFormField(
        controller: emailController,
        decoration: const InputDecoration(
          labelText: 'Adresse mail :',
          hintText: 'Entrez votre adresse mail',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez entrer votre email !';
          }
          return null;
        },
      ),
// Champ 'Message'
      SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: messageController,
              decoration: const InputDecoration(
                labelText: 'Message',
                hintText: 'Écrivez votre message...',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
// Bouton 'Envoyer'
      ElevatedButton(
        onPressed: _submitForm,
        child: const Text('Envoyer'),
        ),
      ],
    ),
  ),
));
}
}
